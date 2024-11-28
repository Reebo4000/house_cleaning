import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:house_cleaning/utils/app_styles.dart';
import 'package:house_cleaning/utils/color_manager.dart';
import 'package:house_cleaning/utils/images_assets.dart';
import 'package:house_cleaning/screens/auth/login_screen.dart';
import 'package:house_cleaning/screens/bottom_bar_screen/bottom_bar_screen.dart';
import 'package:house_cleaning/screens/auth/widgets/custom_elevated_button.dart';
import 'package:house_cleaning/screens/cleaner_profile/cleaner_profile_screen.dart';

class RoleSelectionPage extends StatefulWidget {
  const RoleSelectionPage({super.key});
  static const String routeName = '/role_selection';
  @override
  State<RoleSelectionPage> createState() => _RoleSelectionPageState();
}

class _RoleSelectionPageState extends State<RoleSelectionPage> {
  String? selectedRole;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          children: [
            const Spacer(),
            Image.asset(Assets.imagesLogoSplash),
            Text(
              'Select your role',
              style: AppStyles.styleBold24(context),
            ),
            const SizedBox(height: 10),
            Text(
              'To proceed, choose whether you are a Cleaner or a Client.',
              textAlign: TextAlign.center,
              style: AppStyles.styleMedium16(context).copyWith(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                roleCard('Cleaner', Icons.cleaning_services, 'Find Jobs'),
                roleCard('Client', Icons.home, 'Book Services'),
              ],
            ),
            const Spacer(
              flex: 2,
            ),
            CustomElevatedButton(
              text: "Next",
              onPressed: selectedRole != null
                  ? () {
                      // Proceed to next screen based on role
                      if (selectedRole == 'Cleaner') {
                        // Navigate to CleanerScreen
                        if (FirebaseAuth.instance.currentUser == null) {
                          Navigator.pushNamed(context, LoginScreen.routeName,
                              arguments: selectedRole);
                        } else {
                          Navigator.pushNamed(context,
                              CleanerProfilePage.cleanerProfilerouteName,
                              arguments: selectedRole);
                        }
                      } else if (selectedRole == 'Client') {
                        // Navigate to ClientScreen
                        Navigator.pushNamed(context, BottomBarScreen.routeName);
                      }
                    }
                  : null,
            ),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }

  Widget roleCard(String role, IconData icon, String description) {
    bool isSelected = selectedRole == role;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedRole = role;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? ColorManager.primaryColor.withOpacity(0.2)
              : Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: isSelected
                ? ColorManager.primaryColor
                : Colors.grey.withOpacity(.8),
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,
                size: 40,
                color: isSelected ? ColorManager.primaryColor : Colors.black),
            const SizedBox(height: 10),
            Text(
              role,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isSelected ? ColorManager.primaryColor : Colors.black,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14,
                  color: isSelected ? ColorManager.primaryColor : Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
