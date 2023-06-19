import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
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

import 'NoConnection.dart';

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
        body: OfflineBuilder(
          child: Form(
            key: loginFormKey,
            child: Container(
                padding:  const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Padding(
                    padding:  EdgeInsets.only(top: 40.h),
                    child: Column(
                      children: [
                        const LogoAuth(),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            Text(
                              'email'.tr,
                              style: getBoldStyle(color: ColorManager.black),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
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
                        Row(
                          children: [
                            Text(
                              'password'.tr,
                              style: getBoldStyle(color: ColorManager.black),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
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

                              if (loginFormKey.currentState!.validate()) {
                                String? statusString =
                                getIt<SharedPreferenceHelper>().getStatus();

                                bool? active =
                                getIt<SharedPreferenceHelper>().getActiveStat();
                                if (active == true) {
                                  await Get.offNamed(RouteHelper.successLogin);

                                } else {
                                  snakbarWidget(
                                    context,
                                    Titel: 'dataErorr'.tr,
                                    Description:
                                    'Make sure that Tesrtymf,sdgs.df is Good'.tr,
                                  ).error();
                                }
                              } else {
                                snakbarWidget(
                                  context,
                                  Titel: 'dataErorr'.tr,
                                  Description:
                                  'Make sure  that data is Good'.tr,
                                ).error();
                              }
                            } else {
                              const CircularProgressIndicator();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                )),
          ),
    connectivityBuilder:
    (BuildContext context, ConnectivityResult connectivity, Widget child) {

    final bool connected = connectivity != ConnectivityResult.none;
    return connected?child:NoConnectionScreen();}
        ),
      );
    });
  }
}
