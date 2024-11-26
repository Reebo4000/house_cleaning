import 'dart:io';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:house_cleaning/screens/auth/login_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide User;
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

  Future<void> loginWithFirebase() async {
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
      await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      _user = _auth.currentUser;
      Fluttertoast.showToast(msg: "Sign In Successful.");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(msg: "No user found for that email.");
      }
      if (e.code == 'wrong-password') {
        Fluttertoast.showToast(msg: "Wrong password provided for that user.");
      }
      if (e.code == 'invalid-email') {
        Fluttertoast.showToast(msg: "The email address is not valid.");
      }
      //check internet connection
      if (e.code == 'network-request-failed') {
        Fluttertoast.showToast(msg: "No internet connection.");
      }
      if (e.code == 'network-request-failed') {
        Fluttertoast.showToast(
            backgroundColor: Colors.white,
            textColor: Colors.black,
            msg: "No internet connection.");
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    } finally {
      isLoading = false;
    }
    notifyListeners();
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
      });

      if (context.mounted) {
        Navigator.pushReplacementNamed(context, LoginScreen.routeName);
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
  //add user info to firestore

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
  void updateProfilePic(XFile? image) {
    profilePic = image;
    notifyListeners();
  }

  void updateFrontIdPic(XFile? image) {
    frontIdPic = image;
    notifyListeners();
  }

  void updateBackIdPic(XFile? image) {
    backIdPic = image;
    notifyListeners();
  }
}
