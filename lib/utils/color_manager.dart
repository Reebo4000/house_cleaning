// ignore_for_file: prefer_interpolation_to_compose_strings, non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';

class ColorManager {
  static const Color lightScaffoldColor = Colors.white;
  static const Color lightPrimary = Color(0xFF181059);
  static const Color lightCardColor = Color.fromARGB(106, 250, 250, 250);
  static const Color darkScaffoldColor = Color.fromARGB(255, 9, 3, 27);
  static const Color darkPrimary = Color.fromARGB(255, 94, 75, 236);
  static const Color primaryColor = Color(0xff44C09D);
  static const Color secondaryPrimaryColor = Color.fromARGB(255, 152, 242, 217);
}

Color primary = Color(hexColor('#749BFA'));
Color Secondary = Color(hexColor('#ACC4FF'));
Color white = Color(hexColor('#FFFFFF'));
Color whiteSecondary = Color(hexColor('#E3EBFF'));
Color black = Color(hexColor('#4F4F4F'));
Color greyPrimary = Color(hexColor('#7B7B7B'));
Color grey = Color(hexColor('#C0C0C0'));
Color bgWhite = Color(hexColor('#F8FAFF'));
Color bgBlueWhite = Color(hexColor('#F1F5FE'));
Color bgBlue = Color.fromRGBO(156, 185, 255, 1);
Color logout = Color.fromARGB(255, 255, 156, 168);

int hexColor(String color) {
  //adding prefix
  String newColor = '0xff' + color;
  //removing # sign
  newColor = newColor.replaceAll('#', '');
  //converting it to the integer
  int finalColor = int.parse(newColor);
  return finalColor;
}
