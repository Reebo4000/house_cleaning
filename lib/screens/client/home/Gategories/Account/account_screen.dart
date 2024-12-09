// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:house_cleaning/screens/client/home/Gategories/Account/widgets/About_Screen.dart';
import 'package:house_cleaning/screens/client/home/Gategories/Account/widgets/GetHelp_Screen.dart';
import 'package:house_cleaning/screens/client/home/Gategories/Account/widgets/settings/setting.dart';
import 'package:house_cleaning/screens/client/home/Gategories/Booking/Booking_Screen.dart';
import 'package:house_cleaning/screens/client/home/Gategories/profile/Profile_Screen.dart';
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
            title: Text('Your Orders'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BookingScreen()),
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
                MaterialPageRoute(builder: (context) => ProfileScreen()),
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
                MaterialPageRoute(builder: (context) => AboutAppPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
