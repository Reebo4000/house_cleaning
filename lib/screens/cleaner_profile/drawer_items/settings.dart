import 'package:flutter/material.dart';
import 'package:house_cleaning/utils/color_manager.dart';

class CleanerSettingsPage extends StatelessWidget {
  const CleanerSettingsPage({super.key});
static const String cleanerSettingsRouteName = '/cleaner_settings';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ,
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: ColorManager.primaryColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          ListTile(
            leading: Icon(Icons.language),
            title: Text('Change language'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('change password'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Log out'),
          ),
        ],
      ),
    );
  }
}
