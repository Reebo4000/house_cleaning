import 'package:flutter/material.dart';

class ResponsiveFontSize {
  static double getResponsiveFontSize(BuildContext context,
      {required double fontSize}) {
    double scaleFactor = getScaleFactor(context);

    double responsiveFontSize = fontSize * scaleFactor;

    double lowerLimit = responsiveFontSize * .8;
    double upperLimit = responsiveFontSize * .8;

    return responsiveFontSize.clamp(lowerLimit, upperLimit);
  }

  static double getScaleFactor(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;

    // var dispatcher = PlatformDispatcher.instance;
    // double physicalWidth = dispatcher.views.first.physicalSize.width;
    // double pixelRatio = dispatcher.views.first.devicePixelRatio;
    // double width = physicalWidth / pixelRatio;

    if (width < 918) {
      return width / 350;
    } else if (width < 1414) {
      return width / 1000;
    } else {
      return width / 1700;
    }
  }
}
