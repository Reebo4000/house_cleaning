import 'package:flutter/material.dart';
import 'package:house_cleaning/utils/color_manager.dart';
import 'package:house_cleaning/utils/responsive_font_size.dart';

abstract class AppStyles {
  static TextStyle styleRegular16(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF064060),
      fontSize: ResponsiveFontSize.getResponsiveFontSize(context, fontSize: 16),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleMedium14(BuildContext context) {
    return TextStyle(
      color: ColorManager.primaryColor,
      fontSize: ResponsiveFontSize.getResponsiveFontSize(context, fontSize: 14),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleMedium16(BuildContext context) {
    return TextStyle(
      color: ColorManager.primaryColor,
      fontSize: ResponsiveFontSize.getResponsiveFontSize(context, fontSize: 16),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleSemiBold14(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF064061),
      fontSize: ResponsiveFontSize.getResponsiveFontSize(context, fontSize: 14),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSemiBold16(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF064061),
      fontSize: ResponsiveFontSize.getResponsiveFontSize(context, fontSize: 16),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSemiBold16White(BuildContext context) {
    return TextStyle(
      color: Colors.white,
      fontSize: ResponsiveFontSize.getResponsiveFontSize(context, fontSize: 16),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSemiBold20(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF064061),
      fontSize: ResponsiveFontSize.getResponsiveFontSize(context, fontSize: 20),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSemiBold24(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF4EB7F2),
      fontSize: ResponsiveFontSize.getResponsiveFontSize(context, fontSize: 24),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSemiBold24White(BuildContext context) {
    return TextStyle(
      color: Colors.white,
      fontSize: ResponsiveFontSize.getResponsiveFontSize(context, fontSize: 24),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSemiBold18(BuildContext context) {
    return TextStyle(
      color: const Color(0xFFFFFFFF),
      fontSize: ResponsiveFontSize.getResponsiveFontSize(context, fontSize: 18),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleRegular12(BuildContext context) {
    return TextStyle(
      color: const Color(0xFFAAAAAA),
      fontSize: ResponsiveFontSize.getResponsiveFontSize(context, fontSize: 12),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleRegular14(BuildContext context) {
    return TextStyle(
      color: const Color(0xFFAAAAAA),
      fontSize: ResponsiveFontSize.getResponsiveFontSize(context, fontSize: 14),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleRegular14White(BuildContext context) {
    return TextStyle(
      color: const Color(0xFFFAFAFA),
      fontSize: ResponsiveFontSize.getResponsiveFontSize(context, fontSize: 14),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleBold16(BuildContext context) {
    return TextStyle(
      color: ColorManager.primaryColor,
      fontSize: ResponsiveFontSize.getResponsiveFontSize(context, fontSize: 16),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleBold18(BuildContext context) {
    return TextStyle(
      color: ColorManager.primaryColor,
      fontSize: ResponsiveFontSize.getResponsiveFontSize(context, fontSize: 18),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleBold20(BuildContext context) {
    return TextStyle(
      color: ColorManager.primaryColor,
      fontSize: ResponsiveFontSize.getResponsiveFontSize(context, fontSize: 20),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleBold24(BuildContext context) {
    return TextStyle(
      color: ColorManager.primaryColor,
      fontSize: ResponsiveFontSize.getResponsiveFontSize(context, fontSize: 24),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleBold28(BuildContext context) {
    return TextStyle(
      color: ColorManager.primaryColor,
      fontSize: ResponsiveFontSize.getResponsiveFontSize(context, fontSize: 28),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleMedium20(BuildContext context) {
    return TextStyle(
      color: const Color(0xFFFFFFFF),
      fontSize: ResponsiveFontSize.getResponsiveFontSize(context, fontSize: 20),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w500,
    );
  }

  // static TextStyle styleRegular16 = TextStyle(
  //   color: const Color(0xFF064060),
  //   fontSize: ResponsiveFontSize.getResponsiveFontSize(fontSize: 16),
  //   fontFamily: 'Montserrat',
  //   fontWeight: FontWeight.w400,
  // );
  // static TextStyle styleMedium16 = TextStyle(
  //   color: const Color(0xFF064061),
  //   fontSize: ResponsiveFontSize.getResponsiveFontSize(fontSize: 16),
  //   fontFamily: 'Montserrat',
  //   fontWeight: FontWeight.w500,
  // );
  // static TextStyle styleSemiBold16 = TextStyle(
  //   color: const Color(0xFF064061),
  //   fontSize: ResponsiveFontSize.getResponsiveFontSize(fontSize: 16),
  //   fontFamily: 'Montserrat',
  //   fontWeight: FontWeight.w600,
  // );
  // static TextStyle styleSemiBold16White = TextStyle(
  //   color: Colors.white,
  //   fontSize: ResponsiveFontSize.getResponsiveFontSize(fontSize: 16),
  //   fontFamily: 'Montserrat',
  //   fontWeight: FontWeight.w600,
  // );
  // static TextStyle styleSemiBold20 = TextStyle(
  //   color: const Color(0xFF064061),
  //   fontSize: ResponsiveFontSize.getResponsiveFontSize(fontSize: 20),
  //   fontFamily: 'Montserrat',
  //   fontWeight: FontWeight.w600,
  // );
  // static TextStyle styleSemiBold24 = TextStyle(
  //   color: const Color(0xFF4EB7F2),
  //   fontSize: ResponsiveFontSize.getResponsiveFontSize(fontSize: 24),
  //   fontFamily: 'Montserrat',
  //   fontWeight: FontWeight.w600,
  // );
  // static TextStyle styleSemiBold24White = TextStyle(
  //   color: Colors.white,
  //   fontSize: ResponsiveFontSize.getResponsiveFontSize(fontSize: 24),
  //   fontFamily: 'Montserrat',
  //   fontWeight: FontWeight.w600,
  // );
  // static TextStyle styleSemiBold18 = TextStyle(
  //   color: const Color(0xFFFFFFFF),
  //   fontSize: ResponsiveFontSize.getResponsiveFontSize(fontSize: 18),
  //   fontFamily: 'Montserrat',
  //   fontWeight: FontWeight.w600,
  // );
  // static TextStyle styleRegular12 = TextStyle(
  //   color: const Color(0xFFAAAAAA),
  //   fontSize: ResponsiveFontSize.getResponsiveFontSize(fontSize: 12),
  //   fontFamily: 'Montserrat',
  //   fontWeight: FontWeight.w400,
  // );
  // static TextStyle styleRegular14 = TextStyle(
  //   color: const Color(0xFFAAAAAA),
  //   fontSize: ResponsiveFontSize.getResponsiveFontSize(fontSize: 14),
  //   fontFamily: 'Montserrat',
  //   fontWeight: FontWeight.w400,
  // );
  // static TextStyle styleRegular14White = TextStyle(
  //   color: const Color(0xFFFAFAFA),
  //   fontSize: ResponsiveFontSize.getResponsiveFontSize(fontSize: 14),
  //   fontFamily: 'Montserrat',
  //   fontWeight: FontWeight.w400,
  // );
  // static TextStyle styleBold16 = TextStyle(
  //   color: const Color(0xFF4EB7F2),
  //   fontSize: ResponsiveFontSize.getResponsiveFontSize(fontSize: 16),
  //   fontFamily: 'Montserrat',
  //   fontWeight: FontWeight.w700,
  // );
  // static TextStyle styleMedium20 = TextStyle(
  //   color: const Color(0xFFFFFFFF),
  //   fontSize: ResponsiveFontSize.getResponsiveFontSize(fontSize: 20),
  //   fontFamily: 'Montserrat',
  //   fontWeight: FontWeight.w500,
  // );
}
