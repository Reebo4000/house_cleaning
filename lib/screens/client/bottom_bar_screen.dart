import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:house_cleaning/screens/client/Account/account_screen.dart';
import 'package:house_cleaning/screens/client/Booking/Booking_Screen.dart';
import 'package:house_cleaning/screens/client/home/home_screen.dart';
import 'package:house_cleaning/screens/client/profile/Profile_Screen.dart';
import 'package:house_cleaning/utils/color_manager.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});
  static const String routeName = '/bottom-bar-screen';

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  List<Widget> pages = [
    const HomeScreenWidget(),
    const BookingScreen(),
    ProfilePage(),
    AccountScreen(),
  ];
  int currentPageIndex = 0;
  late PageController controller;

  @override
  void initState() {
    controller = PageController(initialPage: currentPageIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        controller: controller,
        children: pages,
      ),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: ColorManager.primaryColor,
        elevation: 10,
        height: 60,
        style: TabStyle.react,
        items: const [
          TabItem(
            icon: Icon(IconlyLight.home),
            title: 'Home',
            activeIcon: Icon(IconlyBold.home),
          ),
          TabItem(
            icon: Badge(
              label: Text(
                "3",
                style: TextStyle(fontSize: 15, color: Colors.yellow),
              ),
              child: Icon(IconlyLight.bag2),
            ),
            title: 'Booking',
            activeIcon: Badge(
              label: Text(
                "3", // Dynamic badge count
                style: TextStyle(fontSize: 15, color: Colors.yellow),
              ),
              child: Icon(IconlyBold.chart),
            ),
          ),
          TabItem(
            icon: Icon(IconlyLight.profile),
            title: 'Profile',
            activeIcon: Icon(IconlyBold.profile),
          ),
          TabItem(
            icon: Icon(Icons.menu_sharp),
            title: 'Account',
            activeIcon: Icon(Icons.menu_open_sharp),
          ),
        ],
        onTap: (index) {
          setState(() {
            currentPageIndex = index;
            controller.jumpToPage(currentPageIndex);
          });
        },
      ),
    );
  }
}
