// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:house_cleaning/utils/color_manager.dart';


class Clientpayment extends StatelessWidget {
  const Clientpayment({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode
          ? ColorManager.darkScaffoldColor
          : ColorManager.lightScaffoldColor,
      appBar: AppBar(
        title: const Text(
          'Payment',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor:
            isDarkMode ? ColorManager.darkPrimary : ColorManager.lightPrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order Summary',
              style: TextStyle(
                color: isDarkMode
                    ? ColorManager.secondaryPrimaryColor
                    : ColorManager.primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isDarkMode
                    ? ColorManager.darkPrimary.withOpacity(0.1)
                    : ColorManager.lightCardColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Product Name:'),
                      Text('Flutter Course'),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total Price:'),
                      Text('\$50.00'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Payment Method',
              style: TextStyle(
                color: isDarkMode
                    ? ColorManager.secondaryPrimaryColor
                    : ColorManager.primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildPaymentOption(Icons.credit_card, 'Credit Card', isDarkMode),
                _buildPaymentOption(Icons.paypal, 'PayPal', isDarkMode),
                _buildPaymentOption(Icons.phone_android, 'Google Pay', isDarkMode),
              ],
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.primaryColor,
                  padding: const EdgeInsets.symmetric(
                      vertical: 14, horizontal: 32),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text(
                  'Confirm Payment',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption(IconData icon, String label, bool isDarkMode) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: isDarkMode
              ? ColorManager.darkPrimary
              : ColorManager.lightPrimary,
          radius: 30,
          child: Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: isDarkMode
                ? ColorManager.secondaryPrimaryColor
                : ColorManager.primaryColor,
          ),
        ),
      ],
    );
  }
}
