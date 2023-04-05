import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:future_heroes_coach/resources/assets_manager.dart';
import 'package:future_heroes_coach/resources/color_manager.dart';
import 'package:future_heroes_coach/routes/route_helper.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../../resources/font_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../services/auth_provider.dart';
import '../../widgets/snakbar.dart';
import 'NoConnection.dart';

class CodeVerification extends StatefulWidget {
  const CodeVerification({super.key});

  @override
  State<CodeVerification> createState() => _CodeVerificationState();
}

class _CodeVerificationState extends State<CodeVerification> {

  final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();


  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, x) {
      return Scaffold(
          backgroundColor: ColorManager.backGround,
          body: OfflineBuilder(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(top: 40.h),
                  child: Column(children: [
                    SizedBox(
                      height: 40.h,
                    ),
                    SvgPicture.asset(ImageAssets.verification),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      Trans('codeWasSend').tr,
                      textAlign: TextAlign.center,
                      style: getRegularStyle(
                          color: ColorManager.gray, fontSize: 16.sp),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Center(
                      child: Text(provider.emailSendCodeController.text.trim()),

                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: PinFieldAutoFill(
                        decoration: UnderlineDecoration(
                          textStyle: const TextStyle(
                              fontSize: 20, color: ColorManager.primary),
                          colorBuilder:
                          FixedColorBuilder(Colors.black.withOpacity(0.3)),
                        ),
                        codeLength: 4,
                        controller: provider.sendCodeController,
                        currentCode: provider.sendCodeController.text,
                        onCodeSubmitted: (code) {
                          if (code.length == 4) {
                            // showCustomDialog(context);
                          }
                        },
                        onCodeChanged: (code) {
                          if (code!.length == 4) {
                            FocusScope.of(context).requestFocus(FocusNode());
                          }
                        },
                      ),
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Text(Trans('sendCodeAgain').tr),
                    //     Text(
                    //       "$_start",
                    //       style: TextStyle(color: ColorManager.primary),
                    //     ),
                    //     Text(Trans("seconds").tr),
                    //   ],
                    // ),
                    SizedBox(
                      height: 70.h,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 44.h,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: ColorManager.primary, // Background color
                          ),
                          onPressed: provider.isLoading
                              ? null
                              : () async {
                            if (provider.sendCodeController.text
                                .trim()
                                .length ==
                                4) {
                              provider.changeIsLoding(true);
                              String? success =
                              await provider.verifyResetSendCode();
                              if (success == 'true') {
                                provider.changeIsLoding(false);
                                Get.toNamed(RouteHelper.setPassword);
                              } else {
                                provider.changeIsLoding(false);
                                snakbarWidget(context,
                                    Titel: 'CodeWrong'.tr,
                                    Description: 'VerifyCode'.tr)
                                    .Success();
                              }
                            } else {
                              final snackBar = SnackBar(
                                content: Text(Trans('enterCode').tr),
                                backgroundColor: ColorManager.red,
                                duration: const Duration(seconds: 1),
                              );
                              rootScaffoldMessengerKey.currentState
                                  ?.showSnackBar(snackBar);
                            }
                          },
                          child: provider.isLoading
                              ? Row(
                            children: [
                              Text(Trans('verification').tr,
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
                              : Text(Trans('verification').tr,
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
}
