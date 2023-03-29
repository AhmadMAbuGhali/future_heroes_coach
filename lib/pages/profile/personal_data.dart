import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_coach/resources/color_manager.dart';
import 'package:future_heroes_coach/widgets/CustomTextTitle.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import '../../resources/styles_manager.dart';
import '../../routes/route_helper.dart';
import '../../services/app_provider.dart';
import '../../services/shared_preference_helper.dart';
import '../../widgets/CustomButtonPrimary.dart';
import '../../widgets/CustomTextFormAuth.dart';

class PersonalData extends StatefulWidget {
  PersonalData({Key? key}) : super(key: key);

  @override
  State<PersonalData> createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> {
  TextEditingController? name = TextEditingController();
  bool hidePass = true;
  TextEditingController dateInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, provider, x) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: ColorManager.backGround,
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
                            "user".tr,
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
                  text: 'personalDetails'.tr,
                )),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'email'.tr,
                  style: getRegularStyle(color: Colors.black),
                ),
                // const SizedBox(
                //   height: 5,
                // ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  width: double.infinity,
                  height: 44.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: ColorManager.gray, width: 1)),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            provider.profileData!.email ?? "",
                            style: getRegularStyle(color: ColorManager.gray),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'userName'.tr,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),

                Container(
                  width: double.infinity,
                  height: 44.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: ColorManager.gray, width: 1)),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            provider.profileData!.fullName ?? "",
                            style: getRegularStyle(color: ColorManager.gray),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'DOB'.tr,
                  style: TextStyle(fontSize: 12.sp),
                ),
                // const SizedBox(
                //   height: 5,
                // ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  width: double.infinity,
                  height: 44.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: ColorManager.gray, width: 1)),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            provider.profileData!.dateOfBirth!
                                    .split("T")
                                    .first ??
                                "",
                            style: getRegularStyle(color: ColorManager.gray),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'mobileNumber'.tr,
                  style: TextStyle(fontSize: 12.sp),
                ),
                // const SizedBox(
                //   height: 5,
                // ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  width: double.infinity,
                  height: 44.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: ColorManager.gray, width: 1)),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            provider.profileData!.subCategory.toString() ?? "",
                            style: getRegularStyle(color: ColorManager.gray),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomButtonPrimary(
                  text: "changePassword".tr,
                  onpressed: () {
                    print({getIt<SharedPreferenceHelper>().getUserToken()});
                    Get.toNamed(RouteHelper.changePassword);
                  },
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
