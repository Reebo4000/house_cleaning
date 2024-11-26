import 'package:flutter/material.dart';

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget(
      {super.key,
      required this.label,
      this.fontSize = 20,
      this.color,
      this.textOverflow = TextOverflow.ellipsis,
      this.maxLines = 1});
  final String label;
  final double fontSize;
  final Color? color;
  final TextOverflow? textOverflow;

  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: FontWeight.bold,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
