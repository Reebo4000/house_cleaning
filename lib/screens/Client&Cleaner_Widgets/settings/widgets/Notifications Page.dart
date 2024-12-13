// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:house_cleaning/utils/color_manager.dart';

class NotificationsPage extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {
      'title': 'New Order Received',
      'message': 'You have received a new order from John Doe.',
      'date': '2024-12-12 10:30 AM'
    },
    {
      'title': 'Payment Successful',
      'message': 'Your payment of \$50 has been successfully processed.',
      'date': '2024-12-11 4:00 PM'
    },
    {
      'title': 'Reminder',
      'message': 'Your subscription will expire tomorrow.',
      'date': '2024-12-11 9:00 AM'
    },
    // Add more notifications here...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Notifications'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            final notification = notifications[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 16.0),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16.0),
                leading: const Icon(Icons.notifications, color: ColorManager.primaryColor),
                title: Text(
                  notification['title']!,
                  style:const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(notification['message']!),
                trailing: Text(
                  notification['date']!,
                  style:const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                onTap: () {
                  // Handle notification tap, e.g. navigate to a details page
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
