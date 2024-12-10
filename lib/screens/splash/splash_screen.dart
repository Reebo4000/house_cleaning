import 'dart:async';
import 'package:flutter/material.dart';
import 'package:house_cleaning/utils/color_manager.dart';
import 'package:house_cleaning/utils/images_assets.dart';
import 'package:house_cleaning/screens/onboarding/on_borading_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String splashRoute = '/splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: 50).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    Timer(const Duration(seconds: 3), () {
      // Replace with your navigation code
      Navigator.pushReplacementNamed(context, OnboardingScreen.onBoardingRoute);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.lightScaffoldColor, // Use the light scaffold color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, _animation.value),
                  child: child,
                );
              },
              child: Image.asset(Assets.imagesLogoSplash),
            ),
            const SizedBox(height: 20),
            Transform.rotate(
              angle: 0.2, // Adjust this value to control the curvature
              child: const Text(
                'Baytak aman w malyan lam3an ma3 Lam3an',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.primaryColor, // Primary color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
