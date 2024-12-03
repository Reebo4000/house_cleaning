import 'package:flutter/material.dart';
import 'package:house_cleaning/utils/app_styles.dart';
import 'package:house_cleaning/utils/color_manager.dart';
import 'package:house_cleaning/utils/images_assets.dart';
import 'package:house_cleaning/screens/cleaner_profile/drawer_items/help.dart';
import 'package:house_cleaning/screens/cleaner_profile/drawer_items/settings.dart';
import 'package:house_cleaning/screens/cleaner_profile/drawer_items/cleaner_sign_out.dart';

class CleanerProfilePage extends StatefulWidget {
  static const cleanerProfilerouteName = '/cleaner_profile';

  const CleanerProfilePage({super.key});

  @override
  State<CleanerProfilePage> createState() => _CleanerProfilePageState();
}

class _CleanerProfilePageState extends State<CleanerProfilePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // Open the drawer when the page loads
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   _scaffoldKey.currentState?.openDrawer();
    // });
  }

  @override
  void dispose() {
    super.dispose();
  }

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
      body: const Center(
        child: Text(
          'Cleaner Profile Page',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
