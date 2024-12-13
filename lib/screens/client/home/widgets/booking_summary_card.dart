import 'package:flutter/material.dart';

class BookingSummaryCardWidget extends StatelessWidget {
  const BookingSummaryCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: ListTile(
        leading: const Icon(Icons.calendar_today),
        title: const Text('Upcoming: Deep Cleaning'),
        subtitle: const Text('Tomorrow at 10:00 AM'),
        onTap: () {
          // Navigate to booking details
        },
      ),
    );
  }
}
