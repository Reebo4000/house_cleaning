import 'package:flutter/material.dart';
import 'package:house_cleaning/screens/Client&Cleaner_Widgets/About_Screen.dart';
import 'package:house_cleaning/screens/Client&Cleaner_Widgets/GetHelp_Screen.dart';
import 'package:house_cleaning/screens/Client&Cleaner_Widgets/settings/setting.dart';
import 'package:house_cleaning/screens/cleaner/widget/Reservations.dart';
import 'package:house_cleaning/screens/cleaner/widget/cleaner_Payment.dart';
import 'package:house_cleaning/screens/client/profile/Profile_Screen.dart';
import 'package:house_cleaning/utils/app_styles.dart';
import 'package:house_cleaning/utils/color_manager.dart';
import 'package:house_cleaning/utils/images_assets.dart';

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
              leading: const Icon(Icons.book,
                  color: ColorManager.secondaryPrimaryColor),
              title: const Text('Reservations'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReservationsPage()),
                );
                _scaffoldKey.currentState?.closeDrawer();
                setState(() {});
              },
            ),
            ListTile(
              leading: const Icon(Icons.person,
                  color: ColorManager.secondaryPrimaryColor),
              title: const Text('Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
                _scaffoldKey.currentState?.closeDrawer();
                setState(() {});
              },
            ),
            ListTile(
              leading: const Icon(Icons.payment,
                  color: ColorManager.secondaryPrimaryColor),
              title: const Text('Your Payment'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CleanerPaymentPage()),
                );
                _scaffoldKey.currentState?.closeDrawer();
                setState(() {});
              },
            ),
            ListTile(
              leading: const Icon(Icons.help,
                  color: ColorManager.secondaryPrimaryColor),
              title: const Text('Help'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HelpPage()),
                );
                _scaffoldKey.currentState?.closeDrawer();
                setState(() {});
              },
            ),
            ListTile(
              leading: const Icon(Icons.info,
                  color: ColorManager.secondaryPrimaryColor),
              title: const Text('About'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutPage()),
                );
                _scaffoldKey.currentState?.closeDrawer();
                setState(() {});
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings,
                  color: ColorManager.secondaryPrimaryColor),
              title: const Text('Settings'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
                _scaffoldKey.currentState?.closeDrawer();
                setState(() {});
              },
            ),
          ],
        ),
      ),
      body: ProfilePage(),
    );
  }
}
