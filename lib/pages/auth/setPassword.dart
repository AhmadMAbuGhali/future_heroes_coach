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

class SetPassword extends StatefulWidget {
  const SetPassword({super.key});

  @override
  State<SetPassword> createState() => _SetPasswordState();
}

class _SetPasswordState extends State<SetPassword> {
  bool hideNewPass = true;
  bool hideRepeatPass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.backGround,
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
          child: ListView(children: [
            SvgPicture.asset(ImageAssets.set_password),
            SizedBox(
              height: 10.h,
            ),
            CustomTextTitle(
              text: 'typeNewPassword'.tr,
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 10.h,
            ),
             Text(
              'typeNewPassword'.tr,
              style: TextStyle(fontSize: 12),
            ),
            CustomTextFormAuth(
              textInputType: TextInputType.visiblePassword,
              hidepassword: hideNewPass,
              pressSuffixIcon: () {
                setState(() {
                  hideNewPass = !hideNewPass;
                });
              },
              hintText: '*********',

              // labelText: 'كلمة المرور',
              iconData: hideNewPass ? Icons.visibility : Icons.visibility_off,
            ),
            SizedBox(
              height: 10.h,
            ),
             Text(
              'retypePassword'.tr,
              style: TextStyle(fontSize: 12),
            ),
            CustomTextFormAuth(
              textInputType: TextInputType.visiblePassword,
              hidepassword: hideRepeatPass,
              pressSuffixIcon: () {
                setState(() {
                  hideRepeatPass = !hideRepeatPass;
                });
              },
              hintText: '*********',

              // labelText: 'كلمة المرور',
              iconData:
                  hideRepeatPass ? Icons.visibility : Icons.visibility_off,
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomButtonPrimary(
              text: 'passwordReset'.tr,
              onpressed: () {
                Get.toNamed(RouteHelper.login);
              },
            ),
          ]),
        ));
  }
}
