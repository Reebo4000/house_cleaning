// ignore_for_file: file_names, library_private_types_in_public_api, avoid_print

import 'package:flutter/material.dart';
import 'package:house_cleaning/utils/color_manager.dart';

class AccountInfoPage extends StatefulWidget {
  const AccountInfoPage({super.key});

  @override
  _AccountInfoPageState createState() => _AccountInfoPageState();
}

class _AccountInfoPageState extends State<AccountInfoPage> {
  String? _gender = 'Male';
  bool _subscribeToNewsletter = true;
  bool _receiveOffers = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Account info'),
        actions: [
          TextButton(
            onPressed: () {
              // Edit logic
              print('Edit pressed');
            },
            child: const Text(
              'Edit',
              style: TextStyle(color: ColorManager.primaryColor),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                enabled: false, // Non-editable field
              ),
              controller: TextEditingController(text: 'example@gmail.com'),
            ),
            const SizedBox(height: 16.0),
            TextField(
              decoration: const InputDecoration(
                labelText: 'First name',
                border: OutlineInputBorder(),
              ),
              controller: TextEditingController(text: 'FirstName'),
            ),
            const SizedBox(height: 16.0),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Last name',
                border: OutlineInputBorder(),
              ),
              controller: TextEditingController(text: 'LastName'),
            ),
            const SizedBox(height: 16.0),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Date of birth (optional)',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.calendar_today),
              ),
              controller: TextEditingController(text: '01/01/1990'),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Gender (optional)',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    value: 'Male',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value;
                      });
                    },
                    title: const Text('Male'),
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    value: 'Female',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value;
                      });
                    },
                    title: const Text('Female'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            CheckboxListTile(
              value: _receiveOffers,
              onChanged: (value) {
                setState(() {
                  _receiveOffers = value ?? false;
                });
              },
              title: const Text('Yes, I want to receive offers and discounts'),
            ),
            CheckboxListTile(
              value: _subscribeToNewsletter,
              onChanged: (value) {
                setState(() {
                  _subscribeToNewsletter = value ?? false;
                });
              },
              title: const Text('Subscribe to newsletter'),
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                // Delete account logic
                print('Delete account button pressed');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                side: const BorderSide(color: ColorManager.primaryColor),
                padding: const EdgeInsets.symmetric(vertical: 16.0),
              ),
              child: const Text(
                'Delete account',
                style: TextStyle(color: ColorManager.primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
