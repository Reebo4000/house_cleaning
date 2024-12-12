import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:house_cleaning/utils/app_styles.dart';
import 'package:house_cleaning/utils/color_manager.dart';
import 'package:house_cleaning/provider/auth_provider.dart';
import 'package:house_cleaning/screens/selection_screen/role_selection_page.dart';

class SignOut extends StatefulWidget {
  const SignOut({super.key});
  static const String cleanerSignOutRouteName = '/cleaner_SignOut';

  @override
  State<SignOut> createState() => _CleanerSignOutState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _CleanerSignOutState extends State<SignOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, // Set the desired color for the drawer icon
        ),
        elevation: 2,
        shadowColor: ColorManager.primaryColor,
        backgroundColor: ColorManager.primaryColor,
        title: Text(
          'House Cleaning - Profile',
          style:
              AppStyles.styleSemiBold20(context).copyWith(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Are you sure you want to sign out?',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _showSignOutConfirmation(context);
              },
              child: const Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }

  void _showSignOutConfirmation(BuildContext context) {
    AuthProviderr authProvider =
        Provider.of<AuthProviderr>(context, listen: false);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Sign Out'),
          content: const Text('Do you really want to sign out?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                authProvider.signOut();
                // Close the dialog
                _signOut(context); // Call the sign-out function
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Logged out successfully!')),
                );
              },
              child: const Text('Sign Out'),
            ),
          ],
        );
      },
    );
  }

  void _signOut(BuildContext context) {
    // هنا هخليه يتوجه الي صفحه تسجيل الدخول عبدالله
    Navigator.of(context).pushReplacementNamed(
        RoleSelectionPage.routeName); // افترض أن صفحة تسجيل الدخول هي '/login'
  }
}
