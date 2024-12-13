import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  ThemeProvider() {
    // _darktheme = false;
    getTheme();
  }
  static const String themeValueKey = "ThemeValueKey";
  bool _darktheme = false;
  bool get getIsDarkTheme => _darktheme;
  Future<void> setDarkTheme({required bool themeValue}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(themeValueKey, themeValue);
    _darktheme = themeValue;
    notifyListeners();
  }

  Future<void> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _darktheme = prefs.getBool(themeValueKey) ?? false;
    notifyListeners();
    // return _darktheme;
  }
}
