import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:house_cleaning/utils/color_manager.dart';
import 'package:house_cleaning/screens/client/bottom_bar_screen/widgets/cart_screen_widget.dart';
import 'package:house_cleaning/screens/client/bottom_bar_screen/widgets/home_screen_widget.dart';
import 'package:house_cleaning/screens/client/bottom_bar_screen/widgets/menu_screen_widget.dart';
import 'package:house_cleaning/screens/client/bottom_bar_screen/widgets/profile_screen_widet.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});
  static const String routeName = '/bottom-bar-screen';

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  List<Widget> pages = [
    const HomeScreenWidget(),
    const CartScreenWidget(),
    const ProfileScreenWidet(),
    const MenuScreenWidget(),
  ];
  int currentPageIndex = 0;
  late PageController controller;
  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: currentPageIndex);
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
      bottomNavigationBar: NavigationBar(
        indicatorShape: const CircleBorder(),
        indicatorColor: const Color.fromARGB(255, 40, 228, 175),
        backgroundColor: ColorManager.primaryColor,
        elevation: 0,
        height: kBottomNavigationBarHeight,
        selectedIndex: currentPageIndex,
        onDestinationSelected: (index) {
          setState(() {
            currentPageIndex = index;
            controller.jumpToPage(currentPageIndex);
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(
              IconlyLight.home,
            ),
            label: 'Home',
            selectedIcon: Icon(IconlyBold.home),
          ),
          NavigationDestination(
            icon: Badge(
              label: Text(
                "3",
                // "${cartProvider.getCartItems.length}",
                style: TextStyle(fontSize: 15, color: Colors.yellow),
              ),
              child: Icon(IconlyLight.bag2),
            ),
            label: 'Cart',
            selectedIcon: Badge(
              label: Text(
                "3",
                // "${cartProvider.getCartItems.length}",
                style: TextStyle(fontSize: 15, color: Colors.yellow),
              ),
              child: Icon(IconlyBold.bag2),
            ),
          ),
          NavigationDestination(
            icon: Icon(IconlyLight.profile),
            label: 'Profile',
            selectedIcon: Icon(IconlyBold.profile),
          ),
          NavigationDestination(
            icon: Icon(Icons.menu_sharp),
            label: 'Menu',
            selectedIcon: Icon(Icons.menu_open_sharp),
          ),
        ],
      ),
    );
  }
}
