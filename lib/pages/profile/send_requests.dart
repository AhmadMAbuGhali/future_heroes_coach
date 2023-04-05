import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_coach/services/auth_provider.dart';
import 'package:future_heroes_coach/widgets/CustomTextFormAuth.dart';
import 'package:future_heroes_coach/widgets/CustomTextTitle.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/styles_manager.dart';
import '../../routes/route_helper.dart';
import '../../services/app_provider.dart';
import '../../widgets/CustomButtonPrimary.dart';
import '../../widgets/snakbar.dart';
import '../auth/NoConnection.dart';

class SendRequests extends StatelessWidget {
  SendRequests({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, provider, x) {
      return Scaffold(
        body: OfflineBuilder(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: 40.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            IconButton(
                                onPressed: () async {
                                  Get.back();
                                  await provider.getOrderReplay();
                                  await provider.getComplaintReplay();
                                  provider.titleReqController.clear();
                                  provider.subjectReqController.clear();
                                },
                                icon: const Icon(
                                  Icons.arrow_back,
                                  color: ColorManager.primary,
                                )),
                            Text(
                              'requestsAndComplaints'.tr,
                              style: getBoldStyle(color: ColorManager.primary),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Center(
                        child: CustomTextTitle(
                      text: 'sendRequest'.tr,
                    )),
                    SizedBox(
                      height: 24.h,
                    ),
                    Text(
                      'requestAddress'.tr,
                      style: const TextStyle(fontSize: 12),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    CustomTextFormAuth(
                        hidepassword: false,
                        textInputType: TextInputType.text,
                        myController: provider.titleReqController,
                        validator: (value) {},
                        hintText: 'AddressHint'.tr),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'topic'.tr,
                      style: TextStyle(fontSize: 12.sp),
                    ),
                    TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 8,
                      controller: provider.subjectReqController,
                      decoration: InputDecoration(
                        fillColor: ColorManager.white,
                        filled: true,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 14.h),
                        hintText: 'requestTopic'.tr,
                        hintStyle: getRegularStyle(
                            color: ColorManager.otpDesc,
                            fontSize: FontSize.s14),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: ColorManager.borderTextFiel, width: 1.0),
                            borderRadius: BorderRadius.circular(12.r)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(
                              color: ColorManager.primary, width: 1.0.w),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(
                              color: ColorManager.borderTextFiel, width: 1.0.w),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 1.0.w,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60.h,
                    ),
                    CustomButtonPrimary(
                        text: "sendRequest".tr,
                        onpressed: () {
                          if (provider.titleReqController.text
                                  .trim()
                                  .isNotEmpty &&
                              provider.subjectReqController.text
                                  .trim()
                                  .isNotEmpty) {
                            provider.postOrder(
                                provider.titleReqController.text.trim(),
                                provider.subjectReqController.text.trim());
                            snakbarWidget(context,
                                    Titel: 'SentSuccesfully'.tr,
                                    Description: 'TheComplSent'.tr)
                                .Success();
                            provider.titleReqController.clear();
                            provider.subjectReqController.clear();
                          } else {
                            snakbarWidget(context,
                                    Titel: 'DataError'.tr,
                                    Description: 'EnterAllData'.tr)
                                .error();
                          }
                        }),
                  ],
                ),
              ),
            ),
          ),
          connectivityBuilder: (BuildContext context,
              ConnectivityResult connectivity, Widget child) {
            final bool connected = connectivity != ConnectivityResult.none;
            return connected ? child : NoConnectionScreen();
          },
        ),
      );
    });
  }
}
