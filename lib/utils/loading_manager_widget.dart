import 'package:flutter/material.dart';
import 'package:house_cleaning/utils/color_manager.dart';

class LoadingManager extends StatelessWidget {
  const LoadingManager(
      {super.key, required this.isLoading, required this.child});
  final bool isLoading;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading) ...[
          Container(
            color: Colors.black.withOpacity(.7),
          ),
          const Center(
            child: CircularProgressIndicator(
              color: ColorManager.primaryColor,
            ),
          )
        ]
      ],
    );
  }
}
