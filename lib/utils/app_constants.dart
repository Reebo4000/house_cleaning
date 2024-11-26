import 'package:house_cleaning/utils/images_assets.dart';
import 'package:house_cleaning/models/cleaning_category_model.dart';

class AppConstants {
  static List<CleaningCategoryModel> cleaningCategoryList = [
    CleaningCategoryModel(
      title: "Deep Cleaning",
      image: Assets.imagesCleaning,
    ),
    CleaningCategoryModel(
      title: "Regular Cleaning",
      image: Assets.imagesBanner,
    ),
    CleaningCategoryModel(
      title: "One Time Cleaning",
      image: Assets.imagesRepairingperson,
    ),
    CleaningCategoryModel(
      title: "Carpet Cleaning",
      image: Assets.imagesCarpetCleaning,
    ),
    CleaningCategoryModel(
      title: "Window Cleaning",
      image: Assets.imagesWindowCleaning,
    ),
    CleaningCategoryModel(
      title: "Laundry Cleaning",
      image: Assets.imagesLaundry,
    ),
  ];
}
