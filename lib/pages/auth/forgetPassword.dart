import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:future_heroes_coach/resources/assets_manager.dart';
import 'package:future_heroes_coach/resources/color_manager.dart';
import 'package:future_heroes_coach/resources/styles_manager.dart';
import 'package:future_heroes_coach/routes/route_helper.dart';
import 'package:future_heroes_coach/widgets/CustomButtonPrimary.dart';
import 'package:future_heroes_coach/widgets/CustomTextFormAuth.dart';
import 'package:future_heroes_coach/widgets/CustomTextTitle.dart';
import 'package:future_heroes_coach/widgets/LogoAuth.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.backGround,
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
          child: ListView(children: [
            SvgPicture.asset(ImageAssets.forget_password),
            SizedBox(
              height: 10.h,
            ),
            CustomTextTitle(
              text: 'didYouForgotPassword'.tr,
            ),
            const SizedBox(
              height: 30,
            ),
             Text(
              'email'.tr,
              style: getBoldStyle(color: ColorManager.black),
            ),
            const SizedBox(
              height: 5,
            ),
            CustomTextFormAuth(
              hidepassword: false,
              textInputType: TextInputType.emailAddress,
              hintText: 'email'.tr,
            ),
            CustomButtonPrimary(
              text: 'sentVerification'.tr,
              onpressed: () {
                Get.toNamed(RouteHelper.codeVerification);
              },
            ),
          ]),
        ));
  }
}
