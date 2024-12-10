// ignore_for_file: implementation_imports, file_names, use_super_parameters

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:house_cleaning/screens/client/home/Gategories/Booking/widgets/Bookings_List.dart';

class ReadBookings extends StatefulWidget {
  const ReadBookings({Key? key}) : super(key: key);

  @override
  State<ReadBookings> createState() => _ReadBookingsState();
}

class _ReadBookingsState extends State<ReadBookings> {
  @override
  Widget build(BuildContext context) {
    return BookingsList(FirebaseAuth.instance.currentUser!.uid);
  }
}