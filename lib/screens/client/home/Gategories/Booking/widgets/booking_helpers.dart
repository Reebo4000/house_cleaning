// ignore_for_file: prefer_typing_uninitialized_variables, void_checks

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

void storeBooking(
    String placeTypeSelected,
    String durationSelected,
    String provinceSelected,
    String addressDetail,
    String phonenumber,
    DateTime dateTime,
    String additional,
    int total) async {
  await FirebaseFirestore.instance
      .collection('booking_list')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .update({
    'place_type': placeTypeSelected,
    'duration_selected': durationSelected,
    'province': provinceSelected,
    'address_detail': addressDetail,
    'phone_number': phonenumber,
    'booking_time': dateTime,
    'additional': additional,
    'total_price': total
  });
}

var total;
void priceCalculate(placeTypeSelected, provinceSelected, durationSelected) {
  var placeTypePrice;
  var provincePrice;
  var hourPrice;

  if (placeTypeSelected == 'Condo 1-2 BR (40-80 sq.m.)') {
    placeTypePrice = 150;
  } else if (placeTypeSelected == 'Condo 3 BR (100 sq.m.)') {
    placeTypePrice = 225;
  } else if (placeTypeSelected == 'House 1-3 Stories (100-200 sq.m.)') {
    placeTypePrice = 300;
  } else if (placeTypeSelected == 'House (> 200 sq.m.)') {
    placeTypePrice = 350;
  }
  // 500
  if (provinceSelected == 'Bangkok' || provinceSelected == 'Chonburi') {
    provincePrice = 120;
  } else if (provinceSelected == 'Pathum Thani') {
    provincePrice = 100;
  } else if (provinceSelected == 'Chiang Mai') {
    provincePrice = 80;
  }

  if (durationSelected == '2 hr.') {
    hourPrice = 150;
  } else if (durationSelected == '3 hr.') {
    hourPrice = 300;
  } else if (durationSelected == '4 hr.') {
    hourPrice = 450;
  } else if (durationSelected == '5 hr.') {
    hourPrice = 600;
  } else if (durationSelected == '6 hr.') {
    hourPrice = 750;
  } else if (durationSelected == '8 hr.') {
    hourPrice = 900;
  }
  total = placeTypePrice + provincePrice + hourPrice;
  return total;
}
