import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:future_heroes_coach/pages/home/home_screen.dart';

import 'package:future_heroes_coach/pages/profile/profile_page.dart';
import 'package:future_heroes_coach/pages/profile/requests%D9%80and%D9%80complaints.dart';
import 'package:future_heroes_coach/pages/qr_code/qr_code.dart';
import 'package:future_heroes_coach/resources/assets_manager.dart';
import 'package:future_heroes_coach/resources/color_manager.dart';
import 'package:future_heroes_coach/utils/colors.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../notification/notification.dart';

class MainNavBar extends StatefulWidget {
  const MainNavBar({Key? key}) : super(key: key);

  @override
  State<MainNavBar> createState() => _MainNavBarState();
}

class _MainNavBarState extends State<MainNavBar> {
  int _selectedIndex = 0;
  late PersistentTabController _controller;

  List pages = [
    Container(
      child: Center(child: Text('NextPage 1')),
    ),
    Container(
      child: Center(child: Text('NextPage 2 ')),
    ),
    Container(
      child: Center(child: Text('NextPage 3')),
    ),
    Container(
      child: Center(child: Text('NextPage 4')),
    ),
    Container(
      child: Center(child: Text('NextPage 5')),
    ),
  ];

  void onTapNav(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PersistentTabController(initialIndex: 4);
  }

  List<Widget> _buildScreens() {
    return [
      ProfilePage(),
      NotificationPage(),
      QRCode(),
      RequestsAndComplaints(),
      HomeScreen()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(IconAssets.user),
        title: ("user".tr),
        iconSize: 70,
        activeColorPrimary: ColorManager.primary,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(IconAssets.notifications),
        title: ("notification".tr),
        activeColorPrimary: ColorManager.primary,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(IconAssets.qr_code),
        title: ("qrCode".tr),
        activeColorPrimary: ColorManager.primary,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(IconAssets.paper),
        title: ("requests".tr),
        activeColorPrimary: ColorManager.primary,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(IconAssets.home),
        title: ("home".tr),
        activeColorPrimary: ColorManager.primary,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style15, // Choose the nav bar style with this property.
    );
  }
}
