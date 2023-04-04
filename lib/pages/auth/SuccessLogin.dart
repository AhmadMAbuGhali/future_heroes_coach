import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:future_heroes_coach/resources/assets_manager.dart';
import 'package:future_heroes_coach/resources/color_manager.dart';
import 'package:future_heroes_coach/routes/route_helper.dart';
import 'package:future_heroes_coach/services/app_provider.dart';
import 'package:future_heroes_coach/services/auth_provider.dart';
import 'package:future_heroes_coach/widgets/CustomButtonPrimary.dart';
import 'package:future_heroes_coach/widgets/CustomTextTitle.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SuccessLogin extends StatelessWidget {
  const SuccessLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, provider, index) {
      return Consumer<AuthProvider>(builder: (context, AProvider, index) {
        return Scaffold(
          backgroundColor: ColorManager.backGround,
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
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
                CustomTextTitle(text: 'helloAgain'.tr),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'areYouReady'.tr,
                  style: TextStyle(color: ColorManager.gray),
                ),
                CustomButtonPrimary(
                  text: 'goToHome'.tr,
                  onpressed: () async {
                    await provider.getProfileData();
                    await provider.getUserNotification();

                    await Get.offNamed(RouteHelper.initial);
                  },
                )
              ],
            ),
          ),
        );
      });
    });
  }
}
