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
  final FirebaseAuth auth = FirebaseAuth.instance;
  CollectionReference booking =
      FirebaseFirestore.instance.collection('booking_list');

  bool hasDocData = false;
  checkDocData() async {
    DocumentSnapshot ds = await FirebaseFirestore.instance
        .collection("booking_list")
        .doc(auth.currentUser!.uid)
        .get();
    setState(() {
      hasDocData = ds.exists;
    });
  }

  @override
  void initState() {
    super.initState();
    checkDocData();
  }

  @override
  Widget build(BuildContext context) {
    if (hasDocData) {
      return FutureBuilder<Object>(
          future: booking.doc(auth.currentUser!.uid.toString()).get(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            if (snapshot.hasData) {
              final Timestamp time = snapshot.data!['booking_time'];
              final DateTime dateTime = time.toDate();
              final dateSet =
                  DateFormat("yyyy-MM-dd' | 'HH:mm").format(dateTime);

              return Scaffold(
                backgroundColor: bgBlueWhite,
                body: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                          constraints: BoxConstraints(
                            maxHeight: double.infinity,
                          ),
                          color: white,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                          text: 'CLEANING',
                                          style: TextStyle(
                                            fontFamily: TextCustom.subBold,
                                            fontSize: 16.sp,
                                          )),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      WidgetSpan(
                                          child:
                                              Icon(Icons.date_range_outlined)),
                                      TextSpan(
                                          text: ' ${dateSet}',
                                          style: TextStyle(
                                            fontFamily: TextCustom.desRegular,
                                          )),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      WidgetSpan(
                                          child:
                                              Icon(Icons.apartment_outlined)),
                                      TextSpan(
                                          text:
                                              ' ${snapshot.data!['place_type']}',
                                          style: TextStyle(
                                            fontFamily: TextCustom.desRegular,
                                          )),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      WidgetSpan(
                                          child: Icon(Icons.timer_outlined)),
                                      TextSpan(
                                          text:
                                              ' ${snapshot.data!['duration_selected']}',
                                          style: TextStyle(
                                            fontFamily: TextCustom.desRegular,
                                          )),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      WidgetSpan(
                                          child: Icon(
                                              Icons.price_change_outlined)),
                                      TextSpan(
                                          text:
                                              ' ${snapshot.data!['total_price']}',
                                          style: TextStyle(
                                            fontFamily: TextCustom.desRegular,
                                          )),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      WidgetSpan(
                                          child: Icon(Icons.home_outlined)),
                                      TextSpan(
                                          text:
                                              ' ${snapshot.data!['Address']} ',
                                          style: TextStyle(
                                            fontFamily: TextCustom.desRegular,
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
                  ],
                ),
              );
            }
            return CircularProgressIndicator();
          });
    } else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.calendar_month_outlined,
              color: greyPrimary,
              size: 30.w,
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              "No Booking, yet",
              style:
                  TextStyle(fontFamily: TextCustom.desRegular, fontSize: 16.sp),
            ),
            SizedBox(
              height: 2.h,
            ),
            SizedBox(
                width: 45.w,
                height: 6.h,
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40))),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(primary)),
                    onPressed: () async {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return BookingScreen();
                      }));
                    },
                    child: Text(
                      'Book a service',
                      style: TextStyle(
                          fontFamily: TextCustom.desRegular, fontSize: 14.sp),
                    ))),
          ],
        ),
      );
    }
  }
}