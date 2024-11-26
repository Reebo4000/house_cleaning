import 'package:flutter/material.dart';
import 'package:house_cleaning/utils/color_manager.dart';

class IndicatorWidget extends StatelessWidget {
  const IndicatorWidget({super.key, required this.currentPage});
  final int currentPage;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          height: 8.0,
          width: currentPage == index ? 20.0 : 8.0,
          decoration: BoxDecoration(
            color:
                currentPage == index ? ColorManager.primaryColor : Colors.grey,
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
    );
  }
}
