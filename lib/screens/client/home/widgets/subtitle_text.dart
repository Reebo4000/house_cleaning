import 'package:flutter/material.dart';

class SubtitleTextWidget extends StatelessWidget {
  const SubtitleTextWidget({
    super.key,
    required this.label,
    this.fontSize = 18,
    this.fontStyle = FontStyle.normal,
    this.color,
    this.fontWeight,
    this.maxLines = 5,
    this.textDecoration = TextDecoration.none,
  });

  final String label;
  final double fontSize;
  final FontStyle fontStyle;
  final Color? color;
  final FontWeight? fontWeight;
  final TextDecoration textDecoration;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      maxLines: maxLines,
      style: TextStyle(
          fontSize: fontSize,
          fontStyle: fontStyle,
          color: color,
          fontWeight: fontWeight,
          decoration: textDecoration),
    );
  }
}
