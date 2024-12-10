// ignore_for_file: use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';

class AboutAppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About App'),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Text(
          'Home Clean is your cleaning companion!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
