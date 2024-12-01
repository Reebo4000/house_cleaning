import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:house_cleaning/utils/app_styles.dart';
import 'package:house_cleaning/utils/color_manager.dart';
import 'package:house_cleaning/provider/auth_provider.dart';
import 'package:house_cleaning/screens/auth/login_screen.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({super.key});

  static const routeName = '/email_verification';

  @override
  Widget build(BuildContext context) {
    AuthProviderr authProviderr =
        Provider.of<AuthProviderr>(context, listen: false);
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.05),

              // Envelope Icon
              const Icon(
                Icons.mail_outline,
                size: 100,
                color: ColorManager.primaryColor,
              ),
              SizedBox(height: screenHeight * 0.03),

              // Title
              Text(
                "Verify your email address",
                style: AppStyles.styleBold24(context),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenHeight * 0.02),

              // Description
              Text(
                "We have just sent an email verification link to your email. Please check your email and click on the link to verify your email address.\n\nIf not auto redirected after verification, click on the Continue button to log in..",
                style: AppStyles.styleMedium16(context).copyWith(
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenHeight * 0.04),

              // Continue Button
              SizedBox(
                width: screenWidth * 0.8,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate back to login screen
                    Navigator.of(context)
                        .pushReplacementNamed(LoginScreen.routeName);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Continue",
                    style: AppStyles.styleBold18(context).copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),

              // Resend Email Link
              TextButton(
                onPressed: () {
                  // Resend verification email logic

                  authProviderr.verifyEmail();
                },
                child: Text("Resend E-Mail Link",
                    style: AppStyles.styleBold18(context).copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: ColorManager.primaryColor,
                    )),
              ),
              SizedBox(height: screenHeight * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
