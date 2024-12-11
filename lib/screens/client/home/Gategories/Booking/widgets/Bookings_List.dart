// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_brace_in_string_interps, use_key_in_widget_constructors, deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:house_cleaning/screens/client/home/Gategories/Booking/booking_Screen.dart';
import 'package:house_cleaning/utils/color_manager.dart';
import 'package:intl/intl.dart';
import '../../../../../../utils/font.dart';

class BookingsList extends StatefulWidget {
  final String documentId;

  const BookingsList(this.documentId);

  @override
  State<BookingsList> createState() => _BookingsListState();
}

class _BookingsListState extends State<BookingsList> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference _bookingCollection =
      FirebaseFirestore.instance.collection('booking_list');

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: _bookingCollection.doc(_auth.currentUser!.uid).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return const Center(child: Text("An error occurred."));
        }

        if (snapshot.hasData && snapshot.data != null) {
          final data = snapshot.data!.data() as Map<String, dynamic>?;

          if (data != null && data.isNotEmpty) {
            final Timestamp time = data['booking_time'];
            final DateTime dateTime = time.toDate();
            final String formattedDate =
                DateFormat("yyyy-MM-dd | HH:mm").format(dateTime);

            return Scaffold(
              backgroundColor: bgBlueWhite,
              body: ListView(
                padding: const EdgeInsets.all(20.0),
                children: [
                  Container(
                    color: white,
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildRichText('CLEANING', TextCustom.subBold, 16.sp),
                        SizedBox(height: 2.h),
                        _buildRichTextWithIcon(
                          Icons.date_range_outlined,
                          formattedDate,
                        ),
                        SizedBox(height: 1.h),
                        _buildRichTextWithIcon(
                          Icons.apartment_outlined,
                          data['place_type'] ?? 'N/A',
                        ),
                        SizedBox(height: 1.h),
                        _buildRichTextWithIcon(
                          Icons.timer_outlined,
                          data['duration_selected'] ?? 'N/A',
                        ),
                        SizedBox(height: 1.h),
                        _buildRichTextWithIcon(
                          Icons.price_change_outlined,
                          data['total_price'] ?? 'N/A',
                        ),
                        SizedBox(height: 1.h),
                        _buildRichTextWithIcon(
                          Icons.home_outlined,
                          data['Address'] ?? 'N/A',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        }

        return _buildNoBookingWidget();
      },
    );
  }

  Widget _buildRichText(String text, String fontFamily, double fontSize) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize,
      ),
    );
  }

  Widget _buildRichTextWithIcon(IconData icon, String text) {
    return Text.rich(
      TextSpan(
        children: [
          WidgetSpan(child: Icon(icon)),
          TextSpan(
            text: ' $text',
            style: TextStyle(fontFamily: TextCustom.desRegular),
          ),
        ],
      ),
    );
  }

  Widget _buildNoBookingWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.calendar_month_outlined,
            color: greyPrimary,
            size: 30.w,
          ),
          SizedBox(height: 2.h),
          Text(
            "No Booking, yet",
            style: TextStyle(
              fontFamily: TextCustom.desRegular,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(height: 2.h),
          SizedBox(
            width: 45.w,
            height: 6.h,
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(primary),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => BookingScreen()),
                );
              },
              child: Text(
                'Book a service',
                style: TextStyle(
                  fontFamily: TextCustom.desRegular,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
