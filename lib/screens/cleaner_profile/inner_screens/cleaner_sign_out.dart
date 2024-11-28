import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:house_cleaning/provider/auth_provider.dart';

class CleanerSignOut extends StatelessWidget {
  const CleanerSignOut({super.key});
  static const String cleanerSignOutRouteName = '/cleaner_SignOut';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Out'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Are you sure you want to sign out?',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _showSignOutConfirmation(context);
              },
              child: const Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }

  void _showSignOutConfirmation(BuildContext context) {
    AuthProviderr authProvider = Provider.of<AuthProviderr>(context);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Sign Out'),
          content: const Text('Do you really want to sign out?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                authProvider.signOut();
                // Close the dialog
                _signOut(context); // Call the sign-out function
              },
              child: const Text('Sign Out'),
            ),
          ],
        );
      },
    );
  }

  void _signOut(BuildContext context) {
    // هنا هخليه يتوجه الي صفحه تسجيل الدخول ي عبدالله

    Navigator.of(context).pushReplacementNamed(
        '/login'); // افترض أن صفحة تسجيل الدخول هي '/login'
  }
}
