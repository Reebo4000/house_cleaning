import 'dart:io';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:house_cleaning/utils/shared_preferences.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide User;
import 'package:house_cleaning/screens/auth/email_verification_screen.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class AuthProviderr with ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  User? _user;
  User? get user => _user;
  bool isLoading = false;
  List<String> selectedServices = [];

  XFile? profilePic;
  XFile? frontIdPic;
  XFile? backIdPic;

  String? userRole;

  late TextEditingController emailController;
  late TextEditingController passwordController;

  late TextEditingController userNameRController;
  late TextEditingController phoneRController;
  late TextEditingController emailRController;

  late TextEditingController passwordRController;
  late TextEditingController cPasswordRController;
  late TextEditingController addressRController;

  final InternetConnectionChecker connectionChecker =
      InternetConnectionChecker();

//login with firebase
  Future<void> loginWithFirebase() async {
    try {
      // Check network connection
      if (!await isConnected) {
        Fluttertoast.showToast(
          backgroundColor: Colors.white,
          textColor: Colors.black,
          msg: "Please Check Your internet connection.",
        );
        return;
      }

      isLoading = true; // Start loading
      await checkUserRole();
      await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      _user = _auth.currentUser;

      // Check if the email is verified
      if (_user != null && !_user!.emailVerified) {
        Fluttertoast.showToast(
          msg: "Please verify your email before logging in.",
        );
        // await _auth
        //     .signOut(); // Optional: Sign out the user if email is not verified
        isLoading = false; // Stop loading
        notifyListeners(); // Ensure UI updates
        return;
      }

      Fluttertoast.showToast(msg: "Sign In Successful.");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(msg: "No user found for this email.");
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(msg: "Wrong password provided for that user.");
      } else if (e.code == 'invalid-email') {
        Fluttertoast.showToast(msg: "The email address is not valid.");
      } else if (e.code == 'network-request-failed') {
        Fluttertoast.showToast(msg: "No internet connection.");
      }
      isLoading = false; // Stop loading in case of FirebaseAuth exceptions
      notifyListeners(); // Ensure UI updates
      return;
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      isLoading = false; // Stop loading in case of general exceptions
      notifyListeners(); // Ensure UI updates
      return;
    } finally {
      if (isLoading) {
        isLoading = false; // Stop loading if it wasn't reset earlier
      }
      notifyListeners(); // Ensure UI updates
    }
  }

  //register with firebase
  Future<void> registerWithFirebase({required BuildContext context}) async {
    try {
      // first check network connection
      if (!await isConnected) {
        Fluttertoast.showToast(
            backgroundColor: Colors.white,
            textColor: Colors.black,
            msg: "Please Check Your internet connection.");
        return;
      }

      isLoading = true;

      await _auth.createUserWithEmailAndPassword(
          email: emailRController.text, password: passwordRController.text);
      _user = _auth.currentUser;

      final profileUrl = await uploadImageToSupabase(profilePic!, 'profile');
      final frontId = await uploadImageToSupabase(frontIdPic!, 'frontId');
      final backId = await uploadImageToSupabase(backIdPic!, 'backId');

      if (CacheHelper.getData(key: 'user_role') == 'Cleaner') {
        await FirebaseFirestore.instance
            .collection('cleaners')
            .doc(emailRController.text)
            .set({
          'user Name': userNameRController.text,
          'email': emailRController.text,
          'phone': phoneRController.text,
          'address': addressRController.text,
          'profilePic': profileUrl,
          'frontId': frontId,
          'backId': backId,
          'services': selectedServices,
          'rating': 0.0,
          'user_role': 'Cleaner',
        });
      } else {
        await FirebaseFirestore.instance
            .collection('clients')
            .doc(emailRController.text)
            .set({
          'user Name': userNameRController.text,
          'email': emailRController.text,
          'phone': phoneRController.text,
          'address': addressRController.text,
          'profilePic': profileUrl,
          'frontId': frontId,
          'backId': backId,
          'user_role': 'Client',
        });
      }

      if (context.mounted) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushReplacementNamed(
              context, EmailVerificationScreen.routeName);
        });
      }
      Fluttertoast.showToast(
          backgroundColor: Colors.white,
          textColor: Colors.black,
          msg: "Registration successful");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        await Fluttertoast.showToast(
            backgroundColor: Colors.white,
            textColor: Colors.black,
            msg: "The password provided is too weak.");
      }
      if (e.code == 'email-already-in-use') {
        await Fluttertoast.showToast(
            backgroundColor: Colors.white,
            textColor: Colors.black,
            msg: "The account already exists for that email.");
      }
      if (e.code == 'network-request-failed') {
        Fluttertoast.showToast(
            backgroundColor: Colors.white,
            textColor: Colors.black,
            msg: "No internet connection.");
      }
      isLoading = false;
    } catch (e) {
      await Fluttertoast.showToast(
          backgroundColor: Colors.white,
          textColor: Colors.black,
          msg: e.toString());
      isLoading = false;
    } finally {
      isLoading = false;
    }

    notifyListeners();
  }

//check the user_role for from firebase

  Future<String> checkUserRole() async {
    try {
      if (CacheHelper.getData(key: 'user_role') == "Cleaner") {
        await FirebaseFirestore.instance
            .collection('cleaners')
            .doc(emailController.text)
            .get()
            .then((value) => userRole = value.get('user_role'));
        notifyListeners();
      } else {
        await FirebaseFirestore.instance
            .collection('clients')
            .doc(emailController.text)
            .get()
            .then((value) => userRole = value.get('user_role'));
        notifyListeners();
      }
    } on FirebaseException catch (e) {
      if (e.code == 'network-request-failed') {
        Fluttertoast.showToast(
            backgroundColor: Colors.white,
            textColor: Colors.black,
            msg: "No internet connection.");
      }
    } catch (e) {
      await Fluttertoast.showToast(
          backgroundColor: Colors.white,
          textColor: Colors.black,
          msg: "No user found for this email.");
    }
    return userRole ?? "";
  }

//verify email with firebase
  Future<void> verifyEmail() async {
    try {
      // await FirebaseAuth.instance.currentUser!.reload();
      await FirebaseAuth.instance.currentUser?.sendEmailVerification();
      Fluttertoast.showToast(
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        msg: "Please check your email for verification.",
      );
    } catch (e) {
      Fluttertoast.showToast(
        backgroundColor: Colors.white,
        textColor: Colors.black,
        msg: e.toString(),
      );
    }
    notifyListeners();
  }

  //google sign in
  Future<void> googleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await _auth.signInWithCredential(credential);
      _user = _auth.currentUser;
      Fluttertoast.showToast(
          backgroundColor: Colors.white,
          textColor: Colors.black,
          msg: "Sign In Successful.");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'network-request-failed') {
        Fluttertoast.showToast(
            backgroundColor: Colors.white,
            textColor: Colors.black,
            msg: "No internet connection.");
      }
    } catch (e) {
      Fluttertoast.showToast(
          backgroundColor: Colors.white,
          textColor: Colors.black,
          msg: "Sign In Failed");
    }
    notifyListeners();
  }

//sign out from firebase
  Future<void> signOut() async {
    await _auth.signOut();
    //google sign out
    await GoogleSignIn().signOut();
    _user = null;
    notifyListeners();
  }

//upload image to supabase

  Future<String?> uploadImageToSupabase(XFile image, String folderName) async {
    String? uploadedImageUrl;
    try {
      final bytes = await image.readAsBytes();
      final fileExt = image.path.split('.').last;
      final fileName =
          '${FirebaseAuth.instance.currentUser!.email}/$folderName/${emailRController.text.trim()}.$fileExt';

      // Upload the image
      if (CacheHelper.getData(key: 'user_role') == 'Cleaner') {
        final path = await Supabase.instance.client.storage
            .from('cleaners') // Replace with your bucket name
            .uploadBinary(
              fileName,
              bytes,
              fileOptions: FileOptions(contentType: 'image/$fileExt'),
            );
        log('Upload successful! File path: $path');
        // Retrieve the public URL
        final publicUrl = Supabase.instance.client.storage
            .from('cleaners')
            .getPublicUrl(fileName);

        uploadedImageUrl = publicUrl;
        notifyListeners();

        log('Public URL: $uploadedImageUrl');
      } else {
        final path = await Supabase.instance.client.storage
            .from('clients') // Replace with your bucket name
            .uploadBinary(
              fileName,
              bytes,
              fileOptions: FileOptions(contentType: 'image/$fileExt'),
            );
        log('Upload successful! File path: $path'); // Retrieve the public URL
        final publicUrl = Supabase.instance.client.storage
            .from('clients')
            .getPublicUrl(fileName);

        uploadedImageUrl = publicUrl;
        notifyListeners();

        log('Public URL: $uploadedImageUrl');
      }
    } catch (e) {
      log('Error uploading image: $e');
    }
    return uploadedImageUrl;
  }

//get image from supabase

  Future<String?> getImageFromSupabase(String fileName) async {
    try {
      final publicUrl = Supabase.instance.client.storage
          .from('cleaners')
          .getPublicUrl(fileName);
      return publicUrl;
    } catch (e) {
      log('Error getting image: $e');
      return null;
    }
  }

//dispose all controllers
  void disposeControllers() {
    userNameRController.clear();
    emailRController.clear();
    phoneRController.clear();
    passwordRController.clear();
    cPasswordRController.clear();
    addressRController.clear();
    profilePic = null;
    backIdPic = null;
    frontIdPic = null;
  }

  //check internet connection

  Future<bool> get isConnected async => Platform.isAndroid || Platform.isIOS
      ? await connectionChecker.hasConnection
      : true;

  ///
  Future<UserCredential?> signInWithFacebook() async {
    try {
      // Trigger the Facebook sign-in flow
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Check if the login was successful
      if (loginResult.status == LoginStatus.success) {
        // Create a credential from the access token
        final OAuthCredential facebookAuthCredential =
            FacebookAuthProvider.credential(
          '${loginResult.accessToken?.tokenString}',
        );

        // Sign in with Firebase using the credential
        final UserCredential userCredential = await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential);

        // Show success toast
        Fluttertoast.showToast(
          backgroundColor: Colors.white,
          textColor: Colors.black,
          msg: "Registration successful",
        );

        return userCredential;
      } else {
        // Handle Facebook login failure
        Fluttertoast.showToast(
          backgroundColor: Colors.white,
          textColor: Colors.black,
          msg: "Facebook login failed: ${loginResult.message}",
        );
        return null;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        // Show specific error for existing account
        Fluttertoast.showToast(
          backgroundColor: Colors.white,
          textColor: Colors.black,
          msg: "Account already exists with a different credential",
        );
      } else {
        // Handle other FirebaseAuth exceptions
        Fluttertoast.showToast(
          backgroundColor: Colors.white,
          textColor: Colors.black,
          msg: "Firebase Auth error: ${e.message}",
        );
      }
    } catch (e) {
      // Handle any other errors
      Fluttertoast.showToast(
        backgroundColor: Colors.white,
        textColor: Colors.black,
        msg: "An unexpected error occurred: $e",
      );
    }
    return null;
  }
}
