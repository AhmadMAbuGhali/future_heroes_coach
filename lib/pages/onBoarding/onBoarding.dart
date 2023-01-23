import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_coach/pages/onBoarding/Onbording/customButtonWidget.dart';
import 'package:future_heroes_coach/pages/onBoarding/Onbording/customdotController.dart';
import 'package:future_heroes_coach/pages/onBoarding/Onbording/cutomslider.dart';
import 'package:future_heroes_coach/pages/onBoarding/Onbording/onboarding_controller.dart';
import 'package:future_heroes_coach/resources/color_manager.dart';
import 'package:future_heroes_coach/routes/route_helper.dart';
import 'package:future_heroes_coach/widgets/CustomButtonPrimary.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          children: [
            const Expanded(flex: 4, child: CustomSliderOnBoarding()),
            Expanded(
                flex: 2,
                child: Column(
                  children: [
                    const CustomDotControllerOnBoarding(),
                    CustomButtonOnBoarding(
                      textColor: ColorManager.white,
                      buttonColor: ColorManager.primary,
                      text: 'next'.tr,
                    ),
                    CustomButtonPrimary(
                      onpressed: () {
                        Get.offAllNamed(RouteHelper.login);
                      },
                      textColor: ColorManager.primary,
                      buttonColor: ColorManager.white,
                      text: 'skip'.tr,
                    )
                  ],
                ))
          ],
        ),
      ),
    ));
  }
}
