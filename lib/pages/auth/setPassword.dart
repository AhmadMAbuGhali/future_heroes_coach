import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:future_heroes_coach/resources/assets_manager.dart';
import 'package:future_heroes_coach/resources/color_manager.dart';
import 'package:future_heroes_coach/routes/route_helper.dart';
import 'package:future_heroes_coach/widgets/CustomTextFormAuth.dart';
import 'package:future_heroes_coach/widgets/CustomTextTitle.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../resources/font_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../services/auth_provider.dart';
import '../../widgets/snakbar.dart';
import 'NoConnection.dart';
import 'login.dart';

class SetPassword extends StatelessWidget {
  SetPassword({super.key});

  final GlobalKey<FormState> newPasswordFormKey = GlobalKey<FormState>();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, x) {
      return Scaffold(
          key: _scaffoldKey,
          resizeToAvoidBottomInset: false,
          backgroundColor: ColorManager.backGround,
          body: OfflineBuilder(
            child: Form(
              key: newPasswordFormKey,
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Padding(
                  padding:  EdgeInsets.only(top: 40.h),
                  child: Column(children: [
                    SizedBox(
                      height: 40.h,
                    ),
                    SvgPicture.asset(ImageAssets.set_password),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTextTitle(
                      text: 'typeNewPassword'.tr,
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'typeNewPassword'.tr,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    CustomTextFormAuth(
                      textInputType: TextInputType.visiblePassword,
                      hidepassword: provider.hideNewPasswordForget,
                      myController: newPasswordController,
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
                      pressSuffixIcon: () {
                        provider.changeHideNewPasswordForget();
                      },
                      hintText: '*********',

                      // labelText: 'كلمة المرور',
                      iconData: provider.hideNewPasswordForget
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'retypePassword'.tr,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    CustomTextFormAuth(
                      textInputType: TextInputType.visiblePassword,
                      hidepassword: provider.hideConfirmPasswordForget,
                      myController: confirmPasswordController,
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
                      pressSuffixIcon: () {
                        provider.changeHideConfirmPasswordForget();
                      },
                      hintText: '*********',

                      // labelText: 'كلمة المرور',
                      iconData: provider.hideConfirmPasswordForget
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 44.h,
                      //  padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: ColorManager.primary, // Background color
                          ),
                          onPressed: () async {

                            if (newPasswordFormKey.currentState!.validate()) {
                              newPasswordFormKey.currentState!.save();
                              if (newPasswordController.text.trim() ==
                                  confirmPasswordController.text.trim()) {
                                provider.changeIsLoding(true);
                                String? success = await provider.resetPassword(
                                    newPasswordController.text.trim(),
                                    confirmPasswordController.text.trim());
                                if (success == 'true') {
                                  provider.changeIsLoding(false);
                                  showCustomDialog(context,
                                      'assets/animation/successTick.json');
                                  Future.delayed(const Duration(seconds: 3), () {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) => Login()),
                                            (Route<dynamic> route) => false);
                                  });
                                } else {
                                  provider.changeIsLoding(true);
                                  showCustomDialog(
                                      context, 'assets/animation/error.json');
                                }
                              } else {
                                snakbarWidget(context,
                                    Titel: 'PassNotSame'.tr,
                                    Description: 'EnterMatchingPassword'.tr)
                                    .error();
                              }
                            }
                          },
                          child: provider.isLoading
                              ? Row(
                            children: [
                              Text('passwordReset'.tr,
                                  style: getMediumStyle(
                                      color: ColorManager.white,
                                      fontSize: FontSize.s14.sp)),
                              SizedBox(
                                width: 10.w,
                              ),
                              CircularProgressIndicator(
                                  color: ColorManager.white)
                            ],
                          )
                              : Text('passwordReset'.tr,
                              style: getMediumStyle(
                                  color: ColorManager.white,
                                  fontSize: FontSize.s14.sp))),
                    ),
                  ]),
                ),
              ),
            ),
            connectivityBuilder:
                (BuildContext context, ConnectivityResult connectivity, Widget child) {

              final bool connected = connectivity != ConnectivityResult.none;
              return connected?child:NoConnectionScreen();


            },
          ));
    });
  }

  void showCustomDialog(BuildContext context, String animation) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 700),
      pageBuilder: (_, __, ___) {
        return Center(
          child: Container(
            height: 210.h,
            width: 240.w,
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(22.r)),
            child: Column(
              children: [
                SizedBox(
                  width: 120.w,
                  height: 120.h,
                  child: Lottie.asset(animation,
                      width: 120.w, height: 120.h, fit: BoxFit.cover),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  'allOk'.tr,
                  style: getBoldStyle(
                      color: ColorManager.black, fontSize: FontSize.s22),
                )
              ],
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
        }
        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }
}
