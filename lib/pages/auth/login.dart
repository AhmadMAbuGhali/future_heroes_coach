import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_coach/main.dart';
import 'package:future_heroes_coach/resources/color_manager.dart';
import 'package:future_heroes_coach/resources/styles_manager.dart';
import 'package:future_heroes_coach/routes/route_helper.dart';
import 'package:future_heroes_coach/services/auth_provider.dart';
import 'package:future_heroes_coach/services/shared_preference_helper.dart';
import 'package:future_heroes_coach/widgets/CustomButtonPrimary.dart';
import 'package:future_heroes_coach/widgets/CustomTextFormAuth.dart';
import 'package:future_heroes_coach/widgets/CustomTextTitle.dart';
import 'package:future_heroes_coach/widgets/LogoAuth.dart';
import 'package:future_heroes_coach/widgets/snakbar.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, x) {
      return Scaffold(
        key: _scaffoldKey,
        backgroundColor: ColorManager.backGround,
        body: Form(
          key: loginFormKey,
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: ListView(
                children: [
                  const LogoAuth(),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomTextTitle(
                    text: 'login'.tr,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'email'.tr,
                    style: getBoldStyle(color: ColorManager.black),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  CustomTextFormAuth(
                    hidepassword: false,
                    textInputType: TextInputType.emailAddress,
                    myController: provider.emailLoginPage,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'emailEmpty'.tr;
                      } else if (value.isValidEmail() == false) {
                        return 'invalidEmail'.tr;
                      } else if (value.isValidEmail() == true) {
                        return null;
                      }
                      return null;
                    },
                    hintText: 'email'.tr,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'password'.tr,
                    style: getBoldStyle(color: ColorManager.black),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextFormAuth(
                    textInputType: TextInputType.visiblePassword,
                    hidepassword: provider.showPasswordLogin,
                    pressSuffixIcon: () {
                      provider.changeShowPasswordLogin();
                    },
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
                    myController: provider.passwordLoginPage,
                    hintText: 'password'.tr,
                    iconData: provider.showPasswordLogin
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  Row(
                    children: [
                      Switch(
                        value: provider.rememberMe,
                        onChanged: (bool) {
                          provider.changeRememberMe();
                        },
                        activeColor: ColorManager.primary,
                      ),
                      Text(
                        "rememberMe".tr,
                        style: getBoldStyle(
                            color: ColorManager.black, fontSize: 12),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          Get.toNamed(RouteHelper.forgetPassword);
                        },
                        child: Text(
                          'forgotPassword'.tr,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              color: ColorManager.primary, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                  CustomButtonPrimary(
                    text: 'login'.tr,
                    onpressed: () async {
                      provider.changeIsLoding(true);
                      if (provider.loading == false) {
                        loginFormKey.currentState!.save();
                        await provider.login(provider.emailLoginPage.text,
                            provider.passwordLoginPage.text, context);
                        print(getIt<SharedPreferenceHelper>().getUserToken());
                        if (loginFormKey.currentState!.validate()) {
                          String? statusString =
                              getIt<SharedPreferenceHelper>().getStatus();
                          if (statusString == 'success') {
                            await Get.offNamed(RouteHelper.successLogin);
                          } else {
                            snakbarWidget(
                              context,
                              Titel: 'dataErorr'.tr,
                              Description: 'dataErorrDetails'.tr,
                            ).error();
                          }
                        } else {
                          snakbarWidget(
                            context,
                            Titel: 'dataErorr'.tr,
                            Description: 'Make sure asdas that Data is Good'.tr,
                          ).error();
                        }
                      } else {
                        CircularProgressIndicator();
                      }
                    },
                  ),
                ],
              )),
        ),
      );
    });
  }
}
