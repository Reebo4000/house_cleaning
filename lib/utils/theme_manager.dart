import 'package:flutter/material.dart';
import 'package:house_cleaning/utils/color_manager.dart';

class ThemeManager {
  static ThemeData themeData(
      {required bool isDarkTheme, required BuildContext context}) {
    return ThemeData(
      scaffoldBackgroundColor: isDarkTheme
          ? ColorManager.darkScaffoldColor
          : ColorManager.lightScaffoldColor,
      cardColor: isDarkTheme
          ? const Color.fromARGB(255, 13, 6, 37)
          : ColorManager.lightCardColor,
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      appBarTheme: AppBarTheme(
        iconTheme:
            IconThemeData(color: isDarkTheme ? Colors.white : Colors.black),
        backgroundColor: isDarkTheme
            ? ColorManager.darkScaffoldColor
            : ColorManager.lightScaffoldColor,
        centerTitle: false,
        elevation: 0,
        titleTextStyle:
            TextStyle(color: isDarkTheme ? Colors.white : Colors.black),
        shape: Border(
          top: BorderSide(
            color: isDarkTheme
                ? ColorManager.lightScaffoldColor
                : ColorManager.darkScaffoldColor,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: isDarkTheme ? Colors.white : Colors.black,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
              width: 1, color: isDarkTheme ? Colors.white : Colors.black),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 1,
            color: Theme.of(context).colorScheme.error,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 1,
            color: Theme.of(context).colorScheme.error,
          ),
        ),
        contentPadding: const EdgeInsets.all(8),
        filled: true,
      ),
    );
  }
}
