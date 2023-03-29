import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:future_heroes_coach/resources/assets_manager.dart';
import 'package:future_heroes_coach/resources/color_manager.dart';
import 'package:future_heroes_coach/resources/styles_manager.dart';
import 'package:future_heroes_coach/routes/route_helper.dart';
import 'package:future_heroes_coach/widgets/CustomTextFormAuth.dart';
import 'package:future_heroes_coach/widgets/CustomTextTitle.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../resources/font_manager.dart';
import '../../../services/auth_provider.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});

  final GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, x) {
      return Scaffold(
          key: _scaffoldKey,
          backgroundColor: ColorManager.backGround,
          body: Form(
            key: forgetPasswordFormKey,
            child: Container(
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
                  myController: provider.emailSendCodeController,
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
                  //  labelText: 'البريد الالكتروني / رقم الهاتف',
                  //  iconData: Icons.email_outlined,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 44.h,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: ColorManager.primary, // Background color
                      ),
                      onPressed: provider.isLoading
                          ? null
                          : () async {
                              if (forgetPasswordFormKey.currentState!
                                  .validate()) {
                                provider.changeIsLoding(true);
                                forgetPasswordFormKey.currentState!.save();
                                String? success;
                                success = await provider.resetSendCode();
                                provider.changeIsLoding(false);
                                if (success == 'true') {
                                  Get.toNamed(RouteHelper.codeVerification);
                                } else {
                                  final snackBar = SnackBar(
                                    content: SizedBox(
                                        height: 32.h,
                                        child: Center(
                                          child: Text(
                                              success ?? 'emailNotExist'.tr),
                                        )),
                                    backgroundColor: ColorManager.red,
                                    behavior: SnackBarBehavior.floating,
                                    width: 300.w,
                                    duration: const Duration(seconds: 2),
                                  );
                                  rootScaffoldMessengerKey.currentState
                                      ?.showSnackBar(snackBar);
                                }
                              }
                            },
                      child: provider.isLoading
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('sentVerification'.tr,
                                    style: getMediumStyle(
                                        color: ColorManager.white,
                                        fontSize: FontSize.s16.sp)),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Icon(Icons.email),
                                const SizedBox(
                                  width: 10,
                                ),
                                CircularProgressIndicator(
                                    color: ColorManager.white)
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('sentVerification'.tr,
                                    style: getMediumStyle(
                                        color: ColorManager.white,
                                        fontSize: FontSize.s16.sp)),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Icon(Icons.email),
                              ],
                            )),
                ),
              ]),
            ),
          ));
    });
  }
}
