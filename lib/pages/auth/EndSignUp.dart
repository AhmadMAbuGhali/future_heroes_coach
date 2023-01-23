import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:future_heroes_coach/resources/assets_manager.dart';
import 'package:future_heroes_coach/resources/color_manager.dart';
import 'package:future_heroes_coach/routes/route_helper.dart';
import 'package:future_heroes_coach/widgets/CustomButtonPrimary.dart';
import 'package:future_heroes_coach/widgets/CustomTextTitle.dart';
import 'package:get/get.dart';

class EndSignUp extends StatelessWidget {
  const EndSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGround,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: SizedBox(
              width: 200.w,
              height: 200.h,
              child: SvgPicture.asset(
                ImageAssets.welcome,
              ),
            )),
            SizedBox(
              height: 20.h,
            ),
            CustomTextTitle(text: 'welcome'.tr),
            SizedBox(
              height: 20.h,
            ),
            Text(
             "orderUnderReview".tr,
              textAlign: TextAlign.center,
              style: TextStyle(color: ColorManager.gray),
            ),
            CustomButtonPrimary(
              text: 'moveToLogin'.tr,
              onpressed: () {
                Get.offNamed(RouteHelper.login);
              },
            )
          ],
        ),
      ),
    );
  }
}
