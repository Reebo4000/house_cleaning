import 'package:flutter/material.dart';
import 'package:house_cleaning/utils/app_styles.dart';
import 'package:house_cleaning/utils/app_constants.dart';
import 'package:house_cleaning/utils/color_manager.dart';

class FeaturedServicesListView extends StatelessWidget {
  const FeaturedServicesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: AppConstants.cleaningCategoryList.length,
        itemBuilder: (context, index) {
          return Container(
            width: 200.0,
            margin: const EdgeInsets.only(right: 10.0),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    AppConstants.cleaningCategoryList[index].image,
                    height: 150.0,
                    width: 200.0,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Center(
                    child: Container(
                      color: ColorManager.primaryColor,
                      child: Text(
                        AppConstants.cleaningCategoryList[index].title,
                        style: AppStyles.styleSemiBold24(context).copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}