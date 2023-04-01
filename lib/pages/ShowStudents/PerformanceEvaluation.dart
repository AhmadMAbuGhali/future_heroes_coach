import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_coach/resources/assets_manager.dart';
import 'package:future_heroes_coach/resources/color_manager.dart';
import 'package:future_heroes_coach/resources/font_manager.dart';
import 'package:future_heroes_coach/resources/styles_manager.dart';
import 'package:future_heroes_coach/routes/route_helper.dart';
import 'package:future_heroes_coach/services/app_provider.dart';
import 'package:future_heroes_coach/widgets/CustomButtonPrimary.dart';
import 'package:future_heroes_coach/widgets/CustomTextTitle.dart';
import 'package:future_heroes_coach/widgets/cardSubscriptionType.dart';
import 'package:future_heroes_coach/widgets/plusAndMin.dart';
import 'package:future_heroes_coach/widgets/snakbar.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class PerformanceEvaluation extends StatefulWidget {
  const PerformanceEvaluation({super.key});

  @override
  State<PerformanceEvaluation> createState() => _PerformanceEvaluationState();
}

class _PerformanceEvaluationState extends State<PerformanceEvaluation> {
  final TextEditingController detialController = TextEditingController();

  int _currentIntValue = 5;
  late bool Presence = false;
  late bool absence = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, provider, x) {
      return Scaffold(
        backgroundColor: ColorManager.backGround,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
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
                            "home".tr,
                            style: getBoldStyle(color: ColorManager.primary),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                CustomTextTitle(
                  text: 'PerformanceAppraisal'.tr,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Image.asset(
                  ImageAssets.avatar,
                  width: 100,
                ),
                Text('NameOfStudent'.tr),
                Text('Yousef.n.aljazzar@gmail.com'),
                Text('24-11-1999'),
                Container(
                  padding: EdgeInsets.all(5.0),
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(

                      // boxShadow: [
                      //   BoxShadow(
                      //     color: ColorManager.primary.withOpacity(0.3),
                      //     spreadRadius: 8,
                      //     blurRadius: 5,
                      //     offset: Offset(0, 2), // changes position of shadow
                      //   ),
                      // ],
                      border: Border.all(color: ColorManager.primary),
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('AttendanceRecording'.tr),
                      Row(
                        children: [
                          InkWell(
                            onTap: (() {
                              setState(() {
                                Presence = true;
                                absence = false;
                              });
                            }),
                            child: !Presence
                                ? CircleAvatar(
                                    radius: 16.0,
                                    backgroundColor: ColorManager.gray,
                                    child: Icon(
                                      Icons.done,
                                      color: ColorManager.white,
                                    ))
                                : CircleAvatar(
                                    radius: 16.0,
                                    backgroundColor: ColorManager.green,
                                    child: Icon(
                                      Icons.done,
                                      color: ColorManager.white,
                                    )),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          InkWell(
                            onTap: (() {
                              setState(() {
                                Presence = false;
                                absence = true;
                              });
                            }),
                            child: absence
                                ? CircleAvatar(
                                    radius: 16.0,
                                    backgroundColor: ColorManager.red,
                                    child: Icon(
                                      Icons.cancel,
                                      color: ColorManager.white,
                                    ))
                                : CircleAvatar(
                                    radius: 16.0,
                                    backgroundColor: ColorManager.gray,
                                    child: Icon(
                                      Icons.cancel,
                                      color: ColorManager.white,
                                    )),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 300.h,
                  child: ListView.builder(
                      itemCount: provider.standardRate.length,
                      itemBuilder: (context, index) {
                        return PlusWidget(
                          title: provider.standardRate[index].name ?? 'd',
                        );
                      }),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Column(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Row(
                        children: [
                          Text('otherDetails'.tr,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: ColorManager.primary,
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 8,
                      decoration: InputDecoration(
                        fillColor: ColorManager.white,
                        filled: true,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 14.h),
                        hintText: 'otherDetails'.tr,
                        hintStyle: getRegularStyle(
                            color: ColorManager.otpDesc,
                            fontSize: FontSize.s12),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: ColorManager.borderTextFiel, width: 1.0),
                            borderRadius: BorderRadius.circular(12.r)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(
                              color: ColorManager.primary, width: 1.0),
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
                    CustomButtonPrimary(
                        text: 'Submitevaluation'.tr,
                        onpressed: () {
                          // snakbarWidget(context,
                          //     Titel: 'تم الارسال بنجاح',
                          //     Description: 'شكرا لك ايها المعلم');

                          Get.toNamed(RouteHelper.showStudents);
                        }),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
