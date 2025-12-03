
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotelino/core/utils/keyboard.dart';
import 'package:hotelino/features/favorite/presentation/favorite_screen.dart';
import 'package:hotelino/features/home/presentation/provider/home_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import '../core/constants/constants.dart';
import '../features/booking/booking_screen.dart';

class MainBottomNav extends StatefulWidget {
  const MainBottomNav({super.key});

  @override
  State<MainBottomNav> createState() => _MainBottomNavState();
}

class _MainBottomNavState extends State<MainBottomNav> {

  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [
      HomeScreen(),
      FavoriteScreen(),
      BookingScreen(),
      ProfileScreen()
    ];
  }
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
          icon: SvgPicture.asset(
            "assets/images/nav_home.svg",
            width: 20,
            height: 20,
            colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
          activeColorPrimary: AppColors.primary,
          inactiveIcon: SvgPicture.asset(
            "assets/images/nav_home.svg",
            width: 20,
            height: 20,
            colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
          )),
      PersistentBottomNavBarItem(
          icon: SvgPicture.asset(
            "assets/images/nav_favorite.svg",
            width: 20,
            height: 20,
            colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
          activeColorPrimary: AppColors.primary,
          inactiveIcon: SvgPicture.asset(
            "assets/images/nav_favorite.svg",
            width: 20,
            height: 20,
            colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
          )),
      PersistentBottomNavBarItem(
          icon: SvgPicture.asset(
            "assets/images/nav_booking.svg",
            width: 20,
            height: 20,
            colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
          activeColorPrimary: AppColors.primary,
          inactiveIcon: SvgPicture.asset(
            "assets/images/nav_booking.svg",
            width: 20,
            height: 20,
            colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
          )),
      PersistentBottomNavBarItem(
          icon: SvgPicture.asset(
            "assets/images/nav_profile.svg",
            width: 20,
            height: 20,
            colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
          activeColorPrimary: AppColors.primary,
          inactiveIcon: SvgPicture.asset(
            "assets/images/nav_profile.svg",
            width: 20,
            height: 20,
            colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
          )),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
        context,
        controller: _controller,
      onItemSelected: (index){
          unfocusEditors(context);
      },
      screens: _buildScreens(),
      items: _navBarsItems(),
      backgroundColor: Theme.of(context).colorScheme.surface,
      navBarStyle: NavBarStyle.style7,
      hideNavigationBarWhenKeyboardAppears: true,
      stateManagement: true,
      handleAndroidBackButtonPress: true,
      confineToSafeArea: true,
      animationSettings: NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          duration: Duration(milliseconds: 200),
          curve: Curves.ease
        )
      ),
    );
  }
}
