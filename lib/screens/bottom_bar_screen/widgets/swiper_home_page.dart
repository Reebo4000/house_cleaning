import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:house_cleaning/utils/color_manager.dart';
import 'package:house_cleaning/utils/images_assets.dart';

class SwiperHomePage extends StatelessWidget {
  const SwiperHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ClipRRect(
      clipBehavior: Clip.none,
      child: SizedBox(
        height: size.height * .25,
        child: Swiper(
          autoplay: true,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Image.asset(
              Assets.imagesBanner,
            );
          },
          pagination: const SwiperPagination(
              alignment: Alignment.bottomCenter,
              builder: DotSwiperPaginationBuilder(
                color: Colors.white,
                activeColor: ColorManager.primaryColor,
              )),
        ),
      ),
    );
  }
}
