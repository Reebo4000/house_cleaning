import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:house_cleaning/utils/color_manager.dart';
import 'package:house_cleaning/utils/images_assets.dart';

class SwiperHomePage extends StatelessWidget {
  const SwiperHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final List<String> images = [
      Assets.imagesBanner,
      Assets.imagesSwiper2,
      Assets.imagesSwiper1,
    ];

    return ClipRRect(
      clipBehavior: Clip.none,
      child: SizedBox(
        width: size.width,
        height: size.height * 0.45,
        child: Swiper(
          autoplay: true,
          itemCount: images.length,
          itemBuilder: (context, index) {
            return Image.asset(
              images[index],
              fit: BoxFit.cover,
            );
          },
          pagination: const SwiperPagination(
            alignment: Alignment.bottomCenter,
            builder: DotSwiperPaginationBuilder(
              color: Colors.white,
              activeColor: ColorManager.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
