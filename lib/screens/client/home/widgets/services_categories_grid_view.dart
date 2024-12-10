import 'package:flutter/material.dart';
import 'package:house_cleaning/utils/app_styles.dart';
import 'package:house_cleaning/utils/app_constants.dart';
import 'package:house_cleaning/utils/color_manager.dart';

class ServicesCategoriesGridView extends StatelessWidget {
  const ServicesCategoriesGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 15,
      ),
      itemCount: AppConstants.cleaningCategoryList.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {},
          child: Column(
            children: [
              ClipRRect(
                child: Image.asset(
                  AppConstants.cleaningCategoryList[index].image,
                  height: 150.0,
                  width: 150.0,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: ColorManager.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: FittedBox(
                    child: Text(
                      AppConstants.cleaningCategoryList[index].title,
                      style: AppStyles.styleSemiBold20(context).copyWith(
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
    );
  }
}
