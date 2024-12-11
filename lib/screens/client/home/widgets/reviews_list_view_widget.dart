import 'package:flutter/material.dart';

class ReviewsListViewWidget extends StatelessWidget {
  const ReviewsListViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3, // Replace with actual number of reviews
        itemBuilder: (context, index) {
          return Container(
            width: 250.0,
            margin: const EdgeInsets.only(right: 10.0),
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Text(
              'Review ${index + 1}: Great service!',
              style: const TextStyle(fontSize: 14.0),
            ),
          );
        },
      ),
    );
  }
}