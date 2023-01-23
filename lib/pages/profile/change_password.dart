import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../resources/color_manager.dart';
import '../../resources/styles_manager.dart';
import '../../routes/route_helper.dart';
import '../../widgets/CustomButtonPrimary.dart';
import '../../widgets/CustomTextFormAuth.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool hideLastPass = true;
  bool hideNewPass = true;
  bool hideRepeatPass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                top: 45.h,
                left: 20.w,
                right: 20.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: ColorManager.primary,
                          )),
                      Text(
                        'personalDetails'.tr,
                        style: getBoldStyle(color: ColorManager.primary),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Text(
              'lastPassword'.tr,
              style: TextStyle(fontSize: 12.sp),
            ),
            CustomTextFormAuth(
              textInputType: TextInputType.visiblePassword,
              hidepassword: hideLastPass,
              pressSuffixIcon: () {
                setState(() {
                  hideLastPass = !hideLastPass;
                });
              },
              hintText: '*********',

              // labelText: 'كلمة المرور',
              iconData: hideLastPass ? Icons.visibility : Icons.visibility_off,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'typeNewPassword'.tr,
              style: TextStyle(fontSize: 12.sp),
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
              style: TextStyle(fontSize: 12.sp),
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
                text: "save".tr,
                onpressed: () {
                  Get.toNamed(RouteHelper.initial);
                }),
          ],
        ),
      ),
    );
  }
}
