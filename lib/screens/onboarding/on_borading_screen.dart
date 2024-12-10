import 'package:flutter/material.dart';
import 'package:house_cleaning/utils/images_assets.dart';
import 'package:house_cleaning/screens/onboarding/widgets/custom_button.dart';
import 'package:house_cleaning/screens/onboarding/widgets/indicator_widget.dart';
import 'package:house_cleaning/screens/selection_screen/role_selection_page.dart';
import 'package:house_cleaning/screens/onboarding/widgets/onboarding_page_widget.dart';

class OnboardingScreen extends StatefulWidget {
  static const String onBoardingRoute = '/onboarding';

  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: [
                onBordingPageWidget(
                  imagePath: Assets.imagesBHome,
                  title: 'Book Cleaning Instantly',
                  description:
                      'Schedule your cleaning service quickly and easily with just a few taps.',
                ),
                onBordingPageWidget(
                  imagePath: Assets.imagesPlumber,
                  title: 'Trusted Professionals',
                  description:
                      'Our professional cleaners are background-checked and reliable.',
                ),
                onBordingPageWidget(
                  imagePath: Assets.imagesConvenientPayment,
                  title: 'Convenient Payments',
                  description:
                      'Pay seamlessly through our app for a hassle-free experience.',
                ),
              ],
            ),
          ),
          IndicatorWidget(currentPage: _currentPage),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
            child: _currentPage == 2
                ? CustomButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(RoleSelectionPage.routeName);
                    },
                    title: 'Get Started',
                  )
                : CustomButton(
                    title: 'Next',
                    onPressed: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
