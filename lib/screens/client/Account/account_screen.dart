// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:house_cleaning/screens/Client&Cleaner_Widgets/About_Screen.dart';
import 'package:house_cleaning/screens/Client&Cleaner_Widgets/GetHelp_Screen.dart';
import 'package:house_cleaning/screens/Client&Cleaner_Widgets/settings/setting.dart';
import 'package:house_cleaning/screens/client/Account/widget/ClientPayment.dart';
import 'package:house_cleaning/screens/client/Booking/Booking_Screen.dart';
import 'package:house_cleaning/screens/client/profile/Profile_Screen.dart';
import 'package:house_cleaning/utils/color_manager.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
        backgroundColor: ColorManager.primaryColor,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.shopping_bag,
                color: ColorManager.secondaryPrimaryColor),
            title: Text('Your Booking'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BookingScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.payment,
                color: ColorManager.secondaryPrimaryColor),
            title: const Text('Your Payment'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Clientpayment()),
              );
            },
          ),
          ListTile(
            leading:
                Icon(Icons.person, color: ColorManager.secondaryPrimaryColor),
            title: Text('Profile'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
          ListTile(
            leading:
                Icon(Icons.help, color: ColorManager.secondaryPrimaryColor),
            title: Text('Get Help'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HelpPage()),
              );
            },
          ),
          ListTile(
            leading:
                Icon(Icons.info, color: ColorManager.secondaryPrimaryColor),
            title: Text('About App'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
