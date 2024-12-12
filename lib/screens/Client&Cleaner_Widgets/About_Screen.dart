// ignore_for_file: use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';
import 'package:house_cleaning/utils/color_manager.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('About'),
        backgroundColor: ColorManager.primaryColor,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                    'assets/images/logo_splash.png'), 
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Text(
                'LAMEAN',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8),
            Center(
              child: Text(
                'الإصدار: 1.0.0',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(height: 16),
            Divider(),
            Text(
              'SparkleClean is your ultimate solution for effortless home cleaning. Whether you need a one-time deep clean, regular maintenance, or specialized services, SparkleClean connects you with trusted, professional cleaners in your area',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: "Montserrat",
              ),
            ),
            SizedBox(height: 8),
            Text(
              'هذا التطبيق هو أداة رائعة لتسهيل حياتك اليومية. يقدم ميزات مبتكرة وتجربة مستخدم رائعة.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Divider(),
            Text(
              'Easy Learn Acadmy',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Spacer(),
            Center(
              child: Text(
                '© 2024 جميع الحقوق محفوظة',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AboutPage(),
  ));
}
