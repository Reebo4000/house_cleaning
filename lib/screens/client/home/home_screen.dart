import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:house_cleaning/screens/client/home/Gategories/Booking/Booking_Screen.dart';
import 'package:provider/provider.dart';
import 'package:house_cleaning/utils/app_styles.dart';
import 'package:house_cleaning/utils/color_manager.dart';
import 'package:house_cleaning/utils/images_assets.dart';
import 'package:house_cleaning/provider/auth_provider.dart';
import 'package:house_cleaning/provider/theme_provider.dart';
import 'package:house_cleaning/screens/selection_screen/role_selection_page.dart';
import 'package:house_cleaning/screens/client/home/widgets/swiper_home_page.dart';
import 'package:house_cleaning/screens/client/home/widgets/search_text_field.dart';
import 'package:house_cleaning/screens/client/home/widgets/reviews_list_view_widget.dart';
import 'package:house_cleaning/screens/client/home/widgets/services_categories_grid_view.dart';

class HomeScreenWidget extends StatelessWidget {
  const HomeScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthProviderr authProviderr =
        Provider.of<AuthProviderr>(context, listen: false);
    final Size size = MediaQuery.of(context).size;
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        shadowColor: ColorManager.primaryColor,
        toolbarHeight: 60,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.primaryColor,
            statusBarIconBrightness: themeProvider.getIsDarkTheme
                ? Brightness.light
                : Brightness.dark),
        backgroundColor: ColorManager.primaryColor,
        leading: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              Assets.imagesLogoSplashNoTitle,
              width: 80,
              height: 80,
            ),
          ],
        ),
        leadingWidth: 80,
        centerTitle: true,
        title: Text(
          'House Cleaning',
          style: AppStyles.styleBold20(context).copyWith(
            color: Colors.white,
          ),
        ),
        actions: [
          Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
                onPressed: () {
                  // Handle notifications
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                onPressed: () {
                  // Navigate to profile screen
                  authProviderr.signOut();
                  Navigator.of(context)
                      .pushReplacementNamed(RoleSelectionPage.routeName);
                },
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchTextFieldWidget(),
              SizedBox(
                height: size.height * .02,
              ),
              Text(
                'Latest Offers',
                style: AppStyles.styleBold24(context),
              ),
              const SwiperHomePage(),

              const SizedBox(
                height: 20.0,
              ),

              // Service Categories
              Text(
                'Services Categories',
                style: AppStyles.styleBold24(context),
              ),
              const SizedBox(height: 10.0),
              const ServicesCategoriesGridView(),

              // Featured Services
              //client best sellers images and profiles

              // Text(
              //   'Featured Services',
              //   style: AppStyles.styleBold24(context),
              // ),
              // const SizedBox(height: 10.0),
              // const FeaturedServicesListView(),
              const SizedBox(height: 20.0),

              // Booking Summary Section add to profile also for cleaner
              const Text(
                'Your Bookings',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0),
              const BookingScreen(),
              const SizedBox(height: 20.0),

              // User Reviews/Testimonials
              const Text(
                'User Reviews',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0),
              const ReviewsListViewWidget(),
            ],
          ),
        ),
      ),
    );
  }
}