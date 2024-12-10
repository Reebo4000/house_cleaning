// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: Colors.blue,
      ),
      body: SwitchListTile(
        title: const Text('Enable Notifications'),
        value: true,
        onChanged: (value) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(value ? 'Notifications enabled' : 'Notifications disabled')),
          );
        },
      ),
    );
  }
}
