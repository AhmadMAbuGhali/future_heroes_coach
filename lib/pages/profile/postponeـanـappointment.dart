import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/styles_manager.dart';
import '../../routes/route_helper.dart';
import '../../services/app_provider.dart';
import '../../widgets/CustomButtonPrimary.dart';
import '../../widgets/CustomTextFormAuth.dart';
import '../../widgets/CustomTextTitle.dart';

class PostponeAnAppointment extends StatelessWidget {
  PostponeAnAppointment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, provider, x) {
      return Scaffold(
        backgroundColor: ColorManager.backGround,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: 45.h,
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
                            'classTime'.tr,
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
                Center(
                    child: CustomTextTitle(
                  text: 'requestPostponement'.tr,
                )),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  'postponementReason'.tr,
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(
                  height: 5.h,
                ),
                CustomTextFormAuth(
                    hidepassword: false,
                    textInputType: TextInputType.text,
                    myController: provider.reasonController,
                    validator: (Value) {},
                    hintText: 'postponementReasonAddress'.tr),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  'otherDetails'.tr,
                  style: TextStyle(fontSize: 12),
                ),
                TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 8,
                  controller: provider.detailsController,
                  decoration: InputDecoration(
                    fillColor: ColorManager.white,
                    filled: true,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                    hintText: 'otherDetailsHint'.tr,
                    hintStyle: getRegularStyle(
                        color: ColorManager.otpDesc, fontSize: FontSize.s14),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: ColorManager.borderTextFiel, width: 1.0),
                        borderRadius: BorderRadius.circular(12.r)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide:
                          BorderSide(color: ColorManager.primary, width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide(
                          color: ColorManager.borderTextFiel, width: 1.0),
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
                  height: 15.h,
                ),
                CustomButtonPrimary(
                    text: 'sendRequest'.tr,
                    onpressed: () {
                      provider.postUserPostponement(
                          provider.id,
                          provider.reasonController.text.trim(),
                          provider.detailsController.text.trim());
                      Get.toNamed(RouteHelper.initial);
                    }),
              ],
            ),
          ),
        ),
      );
    });
  }
}
