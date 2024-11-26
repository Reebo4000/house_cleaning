import 'package:flutter/material.dart';
import 'package:house_cleaning/utils/app_styles.dart';
import 'package:house_cleaning/utils/color_manager.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManager.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        minimumSize: const Size(300, 50),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: AppStyles.styleSemiBold20(context).copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}
