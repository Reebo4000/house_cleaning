// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class ChangeEmailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Email'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text('Feature to change email here.'),
      ),
    );
  }
}
