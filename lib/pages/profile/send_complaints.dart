import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_coach/widgets/CustomTextFormAuth.dart';
import 'package:future_heroes_coach/widgets/CustomTextTitle.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/styles_manager.dart';
import '../../routes/route_helper.dart';
import '../../services/app_provider.dart';
import '../../services/shared_preference_helper.dart';
import '../../widgets/CustomButtonPrimary.dart';

class SendComplaints extends StatelessWidget {
  SendComplaints({Key? key}) : super(key: key);
  TextEditingController titleController = TextEditingController();
  TextEditingController subjectController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, provider, x) {
      return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.all(16),
            child: SingleChildScrollView(
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
                              'requestsAndComplaints'.tr,
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
                    text: 'sendComplaint'.tr,
                  )),
                  SizedBox(
                    height: 24.h,
                  ),
                  Text(
                    'complaintsAddress'.tr,
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  CustomTextFormAuth(
                      hidepassword: false,
                      textInputType: TextInputType.text,
                      myController: titleController,
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
                    controller: subjectController,
                    decoration: InputDecoration(
                      fillColor: ColorManager.white,
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 14.h),
                      hintText: 'complaintTopic'.tr,
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
                    height: 60.h,
                  ),
                  CustomButtonPrimary(
                      text: "sendComplaint".tr,
                      onpressed: () {
                        print(titleController.text.trim());
                        print(subjectController.text.trim());
                        print({getIt<SharedPreferenceHelper>().getUserToken()});
                        provider.postComplaint(titleController.text.trim(),
                            subjectController.text.trim());
                        Get.toNamed(RouteHelper.requestsAndComplaints);
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
