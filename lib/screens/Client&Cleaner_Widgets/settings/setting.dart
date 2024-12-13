// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:house_cleaning/screens/Client&Cleaner_Widgets/settings/widgets/AccountInfoPage.dart';
import 'package:house_cleaning/screens/Client&Cleaner_Widgets/settings/widgets/Change%20Email%20Page.dart';
import 'package:house_cleaning/screens/Client&Cleaner_Widgets/settings/widgets/Change%20Password%20Page.dart';
import 'package:house_cleaning/screens/Client&Cleaner_Widgets/settings/widgets/Notifications%20Page.dart';
import 'package:house_cleaning/screens/Client&Cleaner_Widgets/settings/widgets/Save_Addresses_Page.dart';
import 'package:house_cleaning/screens/Client&Cleaner_Widgets/settings/widgets/sign_out.dart';
import 'package:house_cleaning/utils/color_manager.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: ColorManager.primaryColor,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.account_circle,
                color: ColorManager.secondaryPrimaryColor),
            title: Text('Account Info'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AccountInfoPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.location_on,
                color: ColorManager.secondaryPrimaryColor),
            title: Text('Save Addresses'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SaveAddressPage()),
              );
            },
          ),
          ListTile(
            leading:
                Icon(Icons.email, color: ColorManager.secondaryPrimaryColor),
            title: Text('Change Email'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChangeEmailPage()),
              );
            },
          ),
          ListTile(
            leading:
                Icon(Icons.lock, color: ColorManager.secondaryPrimaryColor),
            title: Text('Change Password'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChangePasswordPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications,
                color: ColorManager.secondaryPrimaryColor),
            title: Text('Notifications'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationsPage()),
              );
            },
          ),
          ListTile(
            leading:
                Icon(Icons.language, color: ColorManager.secondaryPrimaryColor),
            title: Text('Change Language'),
            onTap: () {
              _showLanguageDialog(context);
            },
          ),
          ListTile(
            leading:
                Icon(Icons.public, color: ColorManager.secondaryPrimaryColor),
            title: Text('Country'),
            onTap: () {
              _showCountryDialog(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.red),
            title: Text('Log Out'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignOut()),
              );
            },
          ),
        ],
      ),
    );
  }

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select Language'),
          content: SingleChildScrollView(
            child: Column(
              children: ['English', 'Arabic', 'French']
                  .map((language) => ListTile(
                        title: Text(language),
                        onTap: () {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('Language changed to $language')),
                          );
                        },
                      ))
                  .toList(),
            ),
          ),
        );
      },
    );
  }

  void _showCountryDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select Country'),
          content: SingleChildScrollView(
            child: Column(
              children: ['USA', 'Egypt', 'Saudi', 'Russia', 'China']
                  .map((country) => ListTile(
                        title: Text(country),
                        onTap: () {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('Country changed to $country')),
                          );
                        },
                      ))
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}
