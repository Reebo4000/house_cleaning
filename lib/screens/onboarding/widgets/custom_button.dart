import 'package:flutter/material.dart';
import 'package:house_cleaning/utils/app_styles.dart';
import 'package:house_cleaning/utils/color_manager.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed, required this.title});

  final void Function() onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        backgroundColor: ColorManager.primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        minimumSize: const Size(100, 50), // Fixed minimum width and height
      ),
      onPressed: onPressed,
      child: SizedBox(
        width: 100, // Match the minimum size's width for consistent appearance
        child: Text(
          title,
          textAlign: TextAlign.center, // Ensure text is centered
          style: AppStyles.styleSemiBold20(context).copyWith(
            color: const Color.fromARGB(255, 24, 71, 26),
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
