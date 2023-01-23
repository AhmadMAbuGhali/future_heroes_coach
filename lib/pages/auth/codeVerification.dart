import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:future_heroes_coach/resources/assets_manager.dart';
import 'package:future_heroes_coach/resources/color_manager.dart';
import 'package:future_heroes_coach/routes/route_helper.dart';
import 'package:future_heroes_coach/widgets/CustomButtonPrimary.dart';
import 'package:future_heroes_coach/widgets/CustomTextFormAuth.dart';
import 'package:future_heroes_coach/widgets/CustomTextTitle.dart';
import 'package:future_heroes_coach/widgets/LogoAuth.dart';
import 'package:get/get.dart';

import '../../resources/styles_manager.dart';

class CodeVerification extends StatefulWidget {
  const CodeVerification({super.key});

  @override
  State<CodeVerification> createState() => _CodeVerificationState();
}

class _CodeVerificationState extends State<CodeVerification> {
  int _start = 60;
  Timer? _timer;
  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = new Timer.periodic(
        oneSec,
        (Timer timer) => setState(() {
              if (_start < 1) {
                timer.cancel();
              } else {
                _start = _start - 1;
              }
            }));
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.backGround,
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
          child: ListView(children: [
            SvgPicture.asset(ImageAssets.verification),
            SizedBox(
              height: 15.h,
            ),
            Text(
              'codeWasSend'.tr,
              textAlign: TextAlign.center,
              style: getRegularStyle(color: ColorManager.gray,fontSize: 16.sp),
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              'Yousef.n.aljazzar@gmail.com',
              textAlign: TextAlign.center,
              style: getRegularStyle(color: ColorManager.primary),
            ),
            SizedBox(
              height: 30.h,
            ),
            CustomTextFormAuth(
              hidepassword: false,
              textInputType: TextInputType.emailAddress,
              hintText: 'enterCode'.tr,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('sendCodeAgain'.tr),
                Text(
                  "$_start",
                  style: TextStyle(color: ColorManager.primary),
                ),
                Text("  seconds".tr),
              ],
            ),
            CustomButtonPrimary(
              text: 'verification'.tr,
              onpressed: () {
                startTimer();
                _start == 0
                    ? Get.toNamed(RouteHelper.setPassword)
                    : startTimer();
              },
            ),
          ]),
        ));
  }
}
