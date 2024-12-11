// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unnecessary_string_interpolations, deprecated_member_use, implicit_call_tearoffs, use_super_parameters, file_names, prefer_typing_uninitialized_variables, void_checks, avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:house_cleaning/screens/client/bottom_bar_screen.dart';
import 'package:house_cleaning/screens/client/home/Gategories/Booking/widgets/Booking_Const.dart';
import 'package:house_cleaning/screens/client/home/Gategories/Booking/widgets/MapLocationPage.dart';
import 'package:house_cleaning/screens/client/home/Gategories/Booking/widgets/booking_helpers.dart';
import 'package:house_cleaning/utils/Field.dart';
import 'package:house_cleaning/utils/color_manager.dart';
import 'package:house_cleaning/utils/font.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);
  
  @override
  State<BookingScreen> createState() => _LocaBookingState();
}

class _LocaBookingState extends State<BookingScreen> {
  final formKey = GlobalKey<FormState>();


  // form value
  String? place_type_selected = '';
  String? address = '';
  String? province_selected = '';
  String? district = '';
  String? addressDetail = '';
  String? phonenumber = '';
  String? duration_selected = '';
  String? additional = '';
  // end form value
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar
      appBar: AppBar(
        iconTheme: IconThemeData(color: greyPrimary),
        leading: BackButton(onPressed: (() {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return BottomBarScreen();
          }));
        })),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      // end appbar

      body: ListView(children: [
        Container(
          decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40))),
          width: 100.w,
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(30.sp, 0, 30.sp, 30.sp),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // title
                  Text(
                    'Book a Service',
                    style: TextStyle(
                        fontSize: 24.sp, fontFamily: TextCustom.desBold),
                  ),
                  // end title
                  SizedBox(height: 15.sp),

                  // Map label
                  Text('Location (optional)'),
                  SizedBox(height: 10.sp),
                  // end Map label

                  // Map form
                  SizedBox(
                      width: double.infinity,
                      height: 7.h,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40))),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromRGBO(242, 242, 242, 1))),
                          onPressed: () async {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return MapLocationPage();
                            }));
                          },
                          child: Text('Add your location',
                              style: TextStyle(color: greyPrimary)))),
                  SizedBox(height: 15.sp),
                  // end map form

                  // label
                  Text('Place Type'),
                  SizedBox(height: 10.sp),
                  // end label

                  // dropdown
                  DropdownButtonFormField<String>(
                    isExpanded: true,
                    hint: Text('Select Place Type'),
                    value: null,
                    validator: (value) => value == null
                        ? 'You should select your place type.'
                        : null,
                    decoration: InputDecorationCustom,
                    items: placeTypeList.map((choice) {
                      return DropdownMenuItem(
                        value: choice,
                        child: Text('$choice'),
                      );
                    }).toList(),
                    onChanged: (val) =>
                        setState(() => place_type_selected = val!),
                    onSaved: (String? place_type_selected) {
                      place_type_selected = place_type_selected!;
                    },
                  ),
                  // end dropdown

                  SizedBox(height: 15.sp),

                  // province form
                  // label
                  Text('Province'),
                  SizedBox(height: 10.sp),
                  // end label
                  // dropdown
                  DropdownButtonFormField<String>(
                    isExpanded: true,
                    hint: Text('Select Province'),
                    value: null,
                    validator: (value) => value == null
                        ? 'You should select your province.'
                        : null,
                    decoration: InputDecorationCustom,
                    items: provinceList.map((p) {
                      return DropdownMenuItem(
                        value: p,
                        child: Text('$p'),
                      );
                    }).toList(),
                    onChanged: (val) =>
                        setState(() => province_selected = val!),
                    onSaved: (String? province_selected) {
                      province_selected = province_selected!;
                    },
                  ),
                  // end dropdown

                  SizedBox(height: 15.sp),
                  // end province form

                  // label
                  Text('Address Detail (optional)'),
                  SizedBox(height: 10.sp),
                  // end label

                  // address detail form
                  TextFormField(
                    style: TextStyle(color: greyPrimary),
                    onChanged: (val) => setState(() => addressDetail = val),
                    onSaved: (String? addressDetail) {
                      addressDetail = addressDetail!;
                    },
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        hintText: 'e.g. Near (landmark)',
                        prefixIcon: Icon(
                          Icons.home_outlined,
                          color: Color.fromRGBO(123, 123, 123, 1),
                        ),
                        fillColor: Color.fromRGBO(242, 242, 242, 1),
                        filled: true),
                  ),
                  SizedBox(height: 15.sp),
                  // end address detail form

                  // label
                  Text('Phone number'),
                  SizedBox(height: 10.sp),
                  // end label

                  // phone number form
                  TextFormField(
                    style: TextStyle(color: greyPrimary),
                    keyboardType: TextInputType.phone,
                    validator: RequiredValidator(
                        errorText: 'Please enter your phone number'),
                    onChanged: (val) => setState(() => phonenumber = val),
                    onSaved: (String? phonenumber) {
                      phonenumber = phonenumber!;
                    },
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        hintText: 'Enter your mobile phone',
                        prefixIcon: Icon(
                          Icons.phone_android_outlined,
                          color: Color.fromRGBO(123, 123, 123, 1),
                        ),
                        fillColor: Color.fromRGBO(242, 242, 242, 1),
                        filled: true),
                  ),
                  SizedBox(height: 15.sp),
                  // end phonenumber form

                  // label
                  Text('Cleaning Duration'),
                  SizedBox(height: 10.sp),
                  // end label

                  // duration dropdown
                  DropdownButtonFormField<String>(
                    isExpanded: true,
                    hint: Text('Select Duration'),
                    value: null,
                    validator: (value) => value == null
                        ? 'You should select cleaning duration.'
                        : null,
                    decoration: InputDecorationCustom,
                    items: durationList.map((choice) {
                      return DropdownMenuItem(
                        value: choice,
                        child: Text('$choice'),
                      );
                    }).toList(),
                    onChanged: (val) =>
                        setState(() => duration_selected = val!),
                    onSaved: (String? duration_selected) {
                      duration_selected = duration_selected!;
                    },
                  ),
                  SizedBox(height: 15.sp),
                  // end duration dropdown

                  // Date Time label
                  Text('When do you need this service?'),
                  SizedBox(height: 10.sp),
                  // end label

                  // Date form
                  Row(
                    children: [
                      SizedBox(
                          width: 38.w,
                          height: 7.h,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40))),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Color.fromRGBO(242, 242, 242, 1))),
                              onPressed: () async {
                                final date = await pickDate();
                                if (date == null) return;

                                final newDateTime = DateTime(
                                    date.year,
                                    date.month,
                                    date.day,
                                    dateTime.hour,
                                    dateTime.minute);
                                setState(() => dateTime = newDateTime);
                              },
                              child: Text(
                                  '${dateTime.day}/${dateTime.month}/${dateTime.year}',
                                  style: TextStyle(color: greyPrimary)))),
                      // end Date form
                      Spacer(),
                      // Time form
                      SizedBox(
                          width: 38.w,
                          height: 7.h,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(40))),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromRGBO(242, 242, 242, 1)),
                              ),
                              onPressed: () async {
                                final time = await pickTime();
                                if (time == null) return;
                                final newDateTime = DateTime(
                                    dateTime.year,
                                    dateTime.month,
                                    dateTime.day,
                                    time.hour,
                                    time.minute);
                                setState(() => dateTime = newDateTime);
                              },
                              child: Text(
                                '${dateTime.hour}:${dateTime.minute}',
                                style: TextStyle(color: greyPrimary),
                              ))),
                    ],
                  ),
                  SizedBox(height: 15.sp),
                  // end Time form

                  // label
                  Text('Additional Detail (optional)'),
                  SizedBox(height: 10.sp),
                  // end label

                  // address detail form
                  TextFormField(
                    style: TextStyle(color: greyPrimary),
                    onChanged: (val) => setState(() => additional = val),
                    onSaved: (String? additional) {
                      additional = additional!;
                    },
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        hintText: 'e.g. Owned a pet, Covid patient',
                        prefixIcon: Icon(
                          Icons.home_outlined,
                          color: Color.fromRGBO(123, 123, 123, 1),
                        ),
                        fillColor: Color.fromRGBO(242, 242, 242, 1),
                        filled: true),
                  ),
                  SizedBox(height: 15.sp),
                  // end address detail form

                  // submit button
                  SizedBox(
                      width: double.infinity,
                      height: 7.h,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40))),
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(primary)),
                          onPressed: () async {
                            print(place_type_selected);
                            print(province_selected);
                            print(phonenumber);
                            priceCalculate(place_type_selected,
                                province_selected, duration_selected);
                            print(total);

                            if (formKey.currentState!.validate()) {
                              storeBooking(
                                  place_type_selected!,
                                  duration_selected!,
                                  province_selected!,
                                  addressDetail!,
                                  phonenumber!,
                                  dateTime,
                                  additional!,
                                  total);
                              formKey.currentState?.reset();
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return BottomBarScreen();
                              }));
                            }
                          },
                          child: Text('CONFIRM'))),
                  // end submit button
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }

  Future<DateTime?> pickDate() => showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime.now().subtract(Duration(days: 0)),
      lastDate: DateTime(2100));
  Future<TimeOfDay?> pickTime() => showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute));
}