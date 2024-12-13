// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reservations',
      home: ReservationsPage(),
    );
  }
}

class Reservation {
  final String clientName;
  final DateTime date;
  final String serviceType;
  final String status;

  Reservation({
    required this.clientName,
    required this.date,
    required this.serviceType,
    required this.status,
  });
}

class ReservationsPage extends StatelessWidget {
  final List<Reservation> reservations = [
    Reservation(
      clientName: 'Ahmed Ali',
      date: DateTime(2024, 12, 15, 9, 0),
      serviceType: 'Home Cleaning',
      status: 'Pending',
    ),
    Reservation(
      clientName: 'Mona Mohammed',
      date: DateTime(2024, 12, 16, 14, 0),
      serviceType: 'Stairs Cleaning',
      status: 'Completed',
    ),
    Reservation(
      clientName: 'Mohammed Said',
      date: DateTime(2024, 12, 17, 11, 0),
      serviceType: 'Office Cleaning',
      status: 'Cancelled',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reservations'),
        backgroundColor: const Color(0xff44C09D), // primaryColor
      ),
      body: ListView.builder(
        itemCount: reservations.length,
        itemBuilder: (context, index) {
          final reservation = reservations[index];
          return Card(
            margin: const EdgeInsets.all(8),
            color: reservation.status == 'Completed'
                ? const Color.fromARGB(
                    255, 110, 212, 183) // secondaryPrimaryColor
                : Colors.white,
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              title: Text(
                reservation.clientName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              subtitle: Text(
                '${reservation.serviceType} - ${reservation.date.toString()}',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              trailing: Chip(
                label: Text(
                  reservation.status,
                  style: TextStyle(
                    color: reservation.status == 'Completed'
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
                backgroundColor: reservation.status == 'Completed'
                    ? Colors.green
                    : reservation.status == 'Cancelled'
                        ? Colors.red
                        : Colors.orange,
              ),
            ),
          );
        },
      ),
    );
  }
}
