import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:future_heroes_coach/main.dart';
import 'package:future_heroes_coach/resources/assets_manager.dart';
import 'package:future_heroes_coach/resources/color_manager.dart';
import 'package:future_heroes_coach/services/shared_preference_helper.dart';

import 'package:get/get.dart';

import '../../routes/route_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  // Future<void> _loadResource() async{
  //   await  Get.find<PopularProductController>().getPopularProductList();
  //   await   Get.find<RecommendedProductController>().getRecommendedProductList();
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _loadResource();z
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();

    animation = CurvedAnimation(parent: controller, curve: Curves.linear);
    Timer(
      const Duration(seconds: 3),
      () {
        if (getIt<SharedPreferenceHelper>().getRememberMe() == true) {
          Get.offNamed(RouteHelper.successLogin);
        } else if (getIt<SharedPreferenceHelper>().getFirstTime() == false) {
          Get.offNamed(RouteHelper.login);
        } else {
          Get.offNamed(RouteHelper.login);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGround,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: animation,
            child: Center(
                child: SizedBox(
              width: 266,
              height: 280,
              child: SvgPicture.asset(
                ImageAssets.logo,
              ),
            )),
          ),
        ],
      ),
    );
  }
}
