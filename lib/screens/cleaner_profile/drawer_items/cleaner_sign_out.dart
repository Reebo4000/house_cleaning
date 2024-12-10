import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:house_cleaning/utils/app_styles.dart';
import 'package:house_cleaning/utils/images_assets.dart';
import 'package:house_cleaning/utils/color_manager.dart';
import 'package:house_cleaning/provider/auth_provider.dart';
import 'package:house_cleaning/screens/cleaner_profile/drawer_items/help.dart';
import 'package:house_cleaning/screens/selection_screen/role_selection_page.dart';
import 'package:house_cleaning/screens/cleaner_profile/drawer_items/settings.dart';


class CleanerSignOut extends StatefulWidget {
  const CleanerSignOut({super.key});
  static const String cleanerSignOutRouteName = '/cleaner_SignOut';

  @override
  State<CleanerSignOut> createState() => _CleanerSignOutState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _CleanerSignOutState extends State<CleanerSignOut> {
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
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.7,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: ColorManager.primaryColor,
              ),
              child: Image.asset(Assets.imagesLogoSplashNoTitle),
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text('Reservations'),
              onTap: () {
                // Navigate to reservations
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                // Navigate to profile
              },
            ),
            ListTile(
              leading: const Icon(Icons.payment),
              title: const Text('Your Payment'),
              onTap: () {
                // Navigate to payment
              },
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Help'),
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, HelpPage.helpPagerouteName);
                _scaffoldKey.currentState?.closeDrawer();
                setState(() {});
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () {
                // Navigate to about
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, CleanerSettingsPage.cleanerSettingsRouteName);
                _scaffoldKey.currentState?.closeDrawer();
                setState(() {});
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Sign Out'),
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, CleanerSignOut.cleanerSignOutRouteName);
                _scaffoldKey.currentState?.closeDrawer();
                setState(() {});
              },
            ),
          ],
        ),
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
