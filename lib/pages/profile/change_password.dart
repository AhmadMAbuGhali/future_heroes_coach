import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_coach/services/auth_provider.dart';
import 'package:future_heroes_coach/widgets/snakbar.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import '../../resources/color_manager.dart';
import '../../resources/styles_manager.dart';
import '../../routes/route_helper.dart';
import '../../services/app_provider.dart';
import '../../services/shared_preference_helper.dart';
import '../../widgets/CustomButtonPrimary.dart';
import '../../widgets/CustomTextFormAuth.dart';

class ChangePassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, provider, x) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
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
                    hidepassword: provider.showOldPasswordAuth,
                    pressSuffixIcon: () {
                      provider.changeShowOldPasswordAuth();
                    },
                    hintText: '*********',
                    myController: provider.oldPass,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'passwordEmpty'.tr;
                      } else if (value.isValidPassword() == false) {
                        return 'invalidPassword'.tr;
                      } else if (value.isValidPassword() == true) {
                        return null;
                      }
                      return null;
                    },
                    // labelText: 'كلمة المرور',
                    iconData: provider.showOldPasswordAuth
                        ? Icons.visibility
                        : Icons.visibility_off,
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
                    hidepassword: provider.showNewPasswordAuth,
                    pressSuffixIcon: () {
                      provider.changeShowNewPasswordAuth();
                    },
                    hintText: '*********',
                    myController: provider.newPass,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'passwordEmpty'.tr;
                      } else if (value.isValidPassword() == false) {
                        return 'invalidPassword'.tr;
                      } else if (value.isValidPassword() == true) {
                        return null;
                      }
                      return null;
                    },
                    // labelText: 'كلمة المرور',
                    iconData: provider.showNewPasswordAuth
                        ? Icons.visibility
                        : Icons.visibility_off,
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
                    hidepassword: provider.showConfPasswordAuth,
                    pressSuffixIcon: () {
                      provider.changeShowConfPasswordAuth();
                    },
                    hintText: '*********',
                    myController: provider.confPass,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'passwordEmpty'.tr;
                      } else if (value.isValidPassword() == false) {
                        return 'invalidPassword'.tr;
                      } else if (value.isValidPassword() == true) {
                        return null;
                      }
                      return null;
                    },
                    // labelText: 'كلمة المرور',
                    iconData: provider.showConfPasswordAuth
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomButtonPrimary(
                      text: "save".tr,
                      onpressed: () {
                        if (provider.newPass.text == provider.confPass.text) {
                          print(
                              {getIt<SharedPreferenceHelper>().getUserToken()});
                          provider.resetPasswordAuthorize(
                              provider.oldPass.text.trim(),
                              provider.newPass.text.trim(),
                              provider.confPass.text.trim());
                          Get.offAllNamed(RouteHelper.initial);
                        } else {
                          snakbarWidget(
                              Titel: 'الباسوورد غير متطابق',
                              Description: 'fdfdf',
                              context);
                        }
                      }),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
