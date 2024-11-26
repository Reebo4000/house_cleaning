import 'package:flutter/material.dart';

Widget onBordingPageWidget({
  required String imagePath,
  required String title,
  required String description,
}) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imagePath,
          scale: 0.6,
        ),
        const SizedBox(height: 30.0),
        Text(
          title,
          style: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 15.0),
        Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16.0,
            color: Colors.grey,
          ),
        ),
      ],
    ),
  );
}
