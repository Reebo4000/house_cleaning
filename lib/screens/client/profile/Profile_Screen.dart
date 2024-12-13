// ignore_for_file: use_key_in_widget_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:house_cleaning/screens/Client&Cleaner_Widgets/settings/widgets/Change%20Email%20Page.dart';
import 'package:house_cleaning/utils/color_manager.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.secondaryPrimaryColor,
        title: const Text(
          'Profile Page',
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                  user?.photoURL ?? 'assets/images/error.png',
                ),
                backgroundColor: ColorManager.secondaryPrimaryColor,
              ),
              const SizedBox(height: 16),
              Text(
                user?.displayName ?? 'No Name',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.primaryColor,
                ),
              ),
              const SizedBox(height: 24),
              Container(
                decoration: BoxDecoration(
                  color: ColorManager.secondaryPrimaryColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    ProfileItem(
                      icon: Icons.email,
                      title: 'Email',
                      value: user?.email ?? 'No Email',
                    ),
                    const Divider(),
                    ProfileItem(
                      icon: Icons.phone,
                      title: 'Phone',
                      value: user?.phoneNumber ?? 'No Phone',
                    ),
                    const Divider(),
                    ProfileItem(
                      icon: Icons.location_on,
                      title: 'Location',
                      value: user?.displayName ?? 'No Location',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ChangeEmailPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
                child: const Text(
                  'Edit Profile',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const ProfileItem({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: ColorManager.primaryColor),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: ColorManager.primaryColor,
              ),
            ),
            Text(
              value,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
