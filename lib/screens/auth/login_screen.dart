import 'dart:io';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:house_cleaning/utils/app_styles.dart';
import 'package:house_cleaning/utils/images_assets.dart';
import 'package:house_cleaning/utils/color_manager.dart';
import 'package:house_cleaning/provider/auth_provider.dart';
import 'package:house_cleaning/screens/auth/valditors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:house_cleaning/utils/loading_manager_widget.dart';
import 'package:house_cleaning/screens/auth/register_screen.dart';
import 'package:house_cleaning/screens/auth/widgets/custom_text_form_field.dart';
import 'package:house_cleaning/screens/auth/widgets/custom_elevated_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final FocusNode emailFocusNode;
  late final FocusNode passwordFocusNode;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool obsecureText = true;
  late AuthProviderr authProvider;

  @override
  void initState() {
    authProvider = Provider.of<AuthProviderr>(context, listen: false);
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();

    authProvider.passwordController = TextEditingController();
    authProvider.emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    authProvider.emailController.dispose();
    authProvider.passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<ThemeProvider>(context);
    final authProvider = Provider.of<AuthProviderr>(context);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // Dismiss keyboard on tap outside
      },
      child: Scaffold(
        resizeToAvoidBottomInset:
            true, // Ensure keyboard doesn't overlap widgets
        appBar: AppBar(
          elevation: 2,
          shadowColor: ColorManager.primaryColor,
          backgroundColor: ColorManager.primaryColor,
          leading: Image.asset(
            Assets.imagesLogoSplashNoTitle,
            fit: BoxFit.contain,
          ),
          leadingWidth: 80,
          centerTitle: true,
          title: Text(
            'House Cleaning',
            style: AppStyles.styleSemiBold24(context).copyWith(
              color: Colors.white,
            ),
          ),
        ),
        body: LoadingManager(
          isLoading: authProvider.isLoading,
          child: ListView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              children: [
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Logo
                      Container(
                        width: MediaQuery.of(context).size.width / 1.5,
                        height: MediaQuery.of(context).size.height / 5,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          Assets.imagesLogoSplash,
                          fit: BoxFit.cover,
                        ),
                      ),

                      // Login Title
                      Text(
                        "Login",
                        style: AppStyles.styleBold24(context),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      // Email Form Field
                      CustomTextFormField(
                        onChanged: (p0) {},
                        controller: authProvider.emailController,
                        focusNode: emailFocusNode,
                        keyboardType: TextInputType.emailAddress,
                        validator: Validators.emailValidator,
                        prefixIcon: Icons.email,
                        hintText: 'Enter Your Email',
                        labelText: 'Email',
                        onFieldSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(passwordFocusNode);
                        },
                      ),
                      const SizedBox(height: 20),
                      // Password Form Field
                      CustomTextFormField(
                        onChanged: (p0) {},
                        controller: authProvider.passwordController,
                        focusNode: passwordFocusNode,
                        obsecureText: obsecureText,
                        prefixIcon: Icons.lock,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              obsecureText = !obsecureText;
                            });
                          },
                          child: Icon(
                            obsecureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                        hintText: 'Enter Your Password',
                        labelText: 'Password',
                        validator: Validators.passwordValidator,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).unfocus(); // Dismiss keyboard
                        },
                      ),

                      // Forget Password
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            // Navigate to forget password screen
                          },
                          child: Text(
                            "Forgot Password?",
                            style: AppStyles.styleSemiBold16(context).copyWith(
                              color: ColorManager.primaryColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      // Login Button
                      CustomElevatedButton(
                        text: "Login",
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            authProvider.isLoading = true;
                            setState(() {});
                            await authProvider.loginWithFirebase();
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      // Divider
                      Row(
                        children: [
                          const Expanded(child: Divider(color: Colors.grey)),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "Or Sign In With",
                              style: AppStyles.styleMedium16(context),
                            ),
                          ),
                          const Expanded(child: Divider(color: Colors.grey)),
                        ],
                      ),

                      // Social Login Buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Google Login Logic
                              authProvider.googleSignIn();
                            },
                            child: SvgPicture.asset(
                              Assets.imagesGoogle,
                              width: 30,
                              height: 30,
                            ),
                          ),
                          const SizedBox(width: 16),
                          IconButton(
                            onPressed: () {
                              // Facebook Login Logic
                            },
                            icon: const Icon(FontAwesomeIcons.facebook),
                            color: Colors.blue,
                            iconSize: 30,
                          ),
                          const SizedBox(width: 16),
                          if (Platform.isIOS)
                            IconButton(
                              onPressed: () {
                                // Apple Login Logic
                              },
                              icon: const Icon(FontAwesomeIcons.apple),
                              color: Colors.black,
                              iconSize: 30,
                            ),
                        ],
                      ),

                      // Sign Up Link
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: AppStyles.styleSemiBold16(context).copyWith(
                              color: ColorManager.primaryColor,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, RegisterScreen.routeName);
                            },
                            child: Text(
                              "Sign Up",
                              style:
                                  AppStyles.styleSemiBold16(context).copyWith(
                                color: ColorManager.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}