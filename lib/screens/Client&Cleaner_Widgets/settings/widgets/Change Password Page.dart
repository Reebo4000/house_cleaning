// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class ChangePasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password'),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Text('Feature to change password here.'),
      ),
    );
  }
}
