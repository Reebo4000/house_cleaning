import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:house_cleaning/utils/app_styles.dart';
import 'package:house_cleaning/utils/color_manager.dart';
import 'package:house_cleaning/utils/images_assets.dart';
import 'package:house_cleaning/provider/auth_provider.dart';
import 'package:house_cleaning/screens/auth/valditors.dart';
import 'package:house_cleaning/screens/auth/login_screen.dart';
import 'package:house_cleaning/utils/loading_manager_widget.dart';
import 'package:house_cleaning/screens/auth/widgets/pick_image_widget.dart';
import 'package:house_cleaning/screens/auth/continue_registeration_screen.dart';
import 'package:house_cleaning/screens/auth/widgets/custom_text_form_field.dart';
import 'package:house_cleaning/screens/auth/widgets/custom_elevated_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static const String routeName = "/register_screen";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();

  late AuthProviderr authProvider;

  final ImagePicker imagePicker = ImagePicker();

  bool obsecureText1 = true;
  bool obsecureText2 = true;

  @override
  void initState() {
    authProvider = Provider.of<AuthProviderr>(context, listen: false);
    authProvider.userNameRController = TextEditingController();
    authProvider.phoneRController = TextEditingController();
    authProvider.emailRController = TextEditingController();
    authProvider.passwordRController = TextEditingController();
    authProvider.cPasswordRController = TextEditingController();
    authProvider.addressRController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    authProvider.disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
          shadowColor: ColorManager.primaryColor,
          backgroundColor: ColorManager.primaryColor,
          title: Text(
            'House Cleaning - Register',
            style: AppStyles.styleSemiBold20(context)
                .copyWith(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: LoadingManager(
          isLoading: authProvider.isLoading,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Logo
                  Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: MediaQuery.of(context).size.height / 7,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: Image.asset(
                      Assets.imagesLogoSplash,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    "Sign Up",
                    style: AppStyles.styleBold24(context),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      PickImageWidget(
                        label: "Profile Picture",
                        image: authProvider.profilePic,
                        onTap: () async {
                          await pickImageFunctionProfilePic(
                              context, imagePicker);
                        },
                      ),
                      PickImageWidget(
                          label: "Front ID",
                          image: authProvider.frontIdPic,
                          onTap: () async {
                            await pickImageFunctionFrontId(
                                context, imagePicker);
                          }),
                      PickImageWidget(
                          label: "Back ID",
                          image: authProvider.backIdPic,
                          onTap: () async {
                            await pickImageFunctionBackId(context, imagePicker);
                          }),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  // Form Fields

                  //UserName Field
                  CustomTextFormField(
                    onChanged: (p0) {},
                    onFieldSubmitted: (p0) {},
                    controller: authProvider.userNameRController,
                    prefixIcon: Icons.person,
                    hintText: 'Enter Your Name',
                    labelText: 'User Name',
                    validator: Validators.userNameValidator,
                  ),
                  const SizedBox(height: 20),

                  //Phone Field
                  CustomTextFormField(
                    onChanged: (p0) {},
                    onFieldSubmitted: (p0) {},
                    controller: authProvider.phoneRController,
                    keyboardType: TextInputType.phone,
                    prefixIcon: Icons.phone,
                    hintText: 'Enter Your Phone Number',
                    labelText: 'Phone Number',
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return 'Please enter a phone number';
                      } else if (p0.length < 10) {
                        return 'Please enter a valid phone number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  //Email Controller
                  CustomTextFormField(
                    onChanged: (p0) {},
                    onFieldSubmitted: (p0) {},
                    controller: authProvider.emailRController,
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icons.email,
                    hintText: 'Enter Your Email',
                    labelText: 'Email',
                    validator: Validators.emailValidator,
                  ),
                  const SizedBox(height: 20),

                  //Password Field
                  CustomTextFormField(
                    onChanged: (p0) {},
                    onFieldSubmitted: (p0) {},
                    controller: authProvider.passwordRController,
                    obsecureText: obsecureText1,
                    prefixIcon: Icons.lock,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          obsecureText1 = !obsecureText1;
                        });
                      },
                      child: Icon(
                        obsecureText1 ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                    hintText: 'Enter Your Password',
                    labelText: 'Password',
                    validator: Validators.passwordValidator,
                  ),
                  const SizedBox(height: 20),

                  //confirm password field
                  CustomTextFormField(
                    onChanged: (p0) {},
                    onFieldSubmitted: (p0) {},
                    controller: authProvider.cPasswordRController,
                    obsecureText: obsecureText2,
                    prefixIcon: Icons.lock,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          obsecureText2 = !obsecureText2;
                        });
                      },
                      child: Icon(
                        obsecureText2 ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                    hintText: 'Confirm Your Password',
                    labelText: 'Confirm Password',
                    validator: (value) {
                      return Validators.repeatPasswordValidator(
                        value: value,
                        password: authProvider.passwordRController.text,
                      );
                    },
                  ),
                  const SizedBox(height: 20),

                  //Address filed
                  CustomTextFormField(
                    onChanged: (p0) {},
                    onFieldSubmitted: (p0) {},
                    controller: authProvider.addressRController,
                    prefixIcon: Icons.location_on_outlined,
                    hintText: 'Enter Your Address',
                    labelText: 'Address',
                    validator: (p0) {
                      return Validators.addressValidator(value: p0);
                    },
                  ),
                  const SizedBox(height: 30),

                  // Submit Button
                  CustomElevatedButton(
                    onPressed: () async {
//check images
                      if (authProvider.profilePic == null) {
                        Fluttertoast.showToast(
                            msg: "Please choose profile picture..");
                        return;
                      }
                      if (authProvider.frontIdPic == null) {
                        Fluttertoast.showToast(
                            msg: "Please choose front ID Picture..");
                        return;
                      }
                      if (authProvider.backIdPic == null) {
                        Fluttertoast.showToast(
                            msg: "Please choose Back ID Picture..");
                        return;
                      }

                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        Navigator.of(context).pushNamed(
                          ContinueRegisterationScreen
                              .continueRegisterationRoute,
                        );
                      }
                    },
                    text: "Continue Registration",
                  ),
                  const SizedBox(height: 10),

                  // Footer
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: AppStyles.styleSemiBold18(context).copyWith(
                          color: ColorManager.primaryColor,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(LoginScreen.routeName);
                        },
                        child: Text(
                          "Sign In",
                          style: AppStyles.styleSemiBold18(context).copyWith(
                            color: ColorManager.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> pickImageFunctionProfilePic(
      BuildContext context, ImagePicker imagePicker) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton.icon(
                onPressed: () async {
                  Navigator.pop(context);
                  authProvider.profilePic =
                      await imagePicker.pickImage(source: ImageSource.gallery);
                  setState(() {});
                },
                icon: const Icon(Icons.browse_gallery),
                label: const Text("Gallery"),
              ),
              TextButton.icon(
                onPressed: () async {
                  Navigator.pop(context);
                  authProvider.profilePic =
                      await imagePicker.pickImage(source: ImageSource.camera);
                  setState(() {});
                },
                icon: const Icon(Icons.camera),
                label: const Text("Camera"),
              ),
              TextButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                  authProvider.profilePic = null;
                  setState(() {});
                },
                icon: const Icon(Icons.delete),
                label: const Text("Remove"),
              ),
              TextButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                  if (authProvider.profilePic != null) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content:
                            Image.file(File(authProvider.profilePic!.path)),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('No image selected')),
                    );
                  }
                },
                icon: const Icon(Icons.image),
                label: const Text("View Image"),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> pickImageFunctionFrontId(
      BuildContext context, ImagePicker imagePicker) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton.icon(
                onPressed: () async {
                  Navigator.pop(context);
                  authProvider.frontIdPic =
                      await imagePicker.pickImage(source: ImageSource.gallery);
                  setState(() {});
                },
                icon: const Icon(Icons.browse_gallery),
                label: const Text("Gallery"),
              ),
              TextButton.icon(
                onPressed: () async {
                  Navigator.pop(context);
                  authProvider.frontIdPic =
                      await imagePicker.pickImage(source: ImageSource.camera);
                  setState(() {});
                },
                icon: const Icon(Icons.camera),
                label: const Text("Camera"),
              ),
              TextButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                  authProvider.frontIdPic = null;
                  setState(() {});
                },
                icon: const Icon(Icons.delete),
                label: const Text("Remove"),
              ),
              TextButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                  if (authProvider.frontIdPic != null) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content:
                            Image.file(File(authProvider.frontIdPic!.path)),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('No image selected')),
                    );
                  }
                },
                icon: const Icon(Icons.image),
                label: const Text("View Image"),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> pickImageFunctionBackId(
      BuildContext context, ImagePicker imagePicker) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton.icon(
                onPressed: () async {
                  Navigator.pop(context);
                  authProvider.backIdPic =
                      await imagePicker.pickImage(source: ImageSource.gallery);
                  setState(() {});
                },
                icon: const Icon(Icons.browse_gallery),
                label: const Text("Gallery"),
              ),
              TextButton.icon(
                onPressed: () async {
                  Navigator.pop(context);
                  authProvider.backIdPic =
                      await imagePicker.pickImage(source: ImageSource.camera);
                  setState(() {});
                },
                icon: const Icon(Icons.camera),
                label: const Text("Camera"),
              ),
              TextButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                  authProvider.backIdPic = null;
                  setState(() {});
                },
                icon: const Icon(Icons.delete),
                label: const Text("Remove"),
              ),
              TextButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                  if (authProvider.backIdPic != null) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: Image.file(File(authProvider.backIdPic!.path)),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('No image selected')),
                    );
                  }
                },
                icon: const Icon(Icons.image),
                label: const Text("View Image"),
              ),
            ],
          ),
        );
      },
    );
  }
}
