import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_coach/data/api/apiconst.dart';
import 'package:future_heroes_coach/resources/color_manager.dart';
import 'package:future_heroes_coach/resources/font_manager.dart';
import 'package:future_heroes_coach/resources/styles_manager.dart';
import 'package:future_heroes_coach/routes/route_helper.dart';
import 'package:future_heroes_coach/services/app_provider.dart';
import 'package:future_heroes_coach/widgets/CustomButtonPrimary.dart';
import 'package:future_heroes_coach/widgets/CustomTextTitle.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../auth/NoConnection.dart';

class PerformanceEvaluation extends StatefulWidget {
  const PerformanceEvaluation({super.key});

  @override
  State<PerformanceEvaluation> createState() => _PerformanceEvaluationState();
}

class _PerformanceEvaluationState extends State<PerformanceEvaluation> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, provider, x) {
      return Scaffold(
        backgroundColor: ColorManager.backGround,
        body: OfflineBuilder(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Padding(
                padding: EdgeInsets.only(top: 40.h),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Get.back();
                                  provider.moreDetailsRate.clear();
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
                    Text('PerformanceAppraisal'.tr),
                    SizedBox(
                      height: 10.h,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 50.r,
                              backgroundImage: Image.network(
                                ApiConstant.imageURL +
                                    provider.studentModel[provider.studentID]
                                        .imageString!,
                                width: 100,
                              ).image,
                              foregroundImage: Image.network(
                                ApiConstant.imageURL +
                                    provider.studentModel[provider.studentID]
                                        .imageString!,
                                width: 100,
                              ).image,
                            ),
                            Text(provider
                                .studentModel[provider.studentID].fullName!),
                            Text(provider
                                .studentModel[provider.studentID].email!),
                            Text(provider.studentModel[provider.studentID]
                                .membershipNo!),
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
                                  border:
                                      Border.all(color: ColorManager.primary),
                                  borderRadius: BorderRadius.circular(8.0)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('AttendanceRecording'.tr),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: (() {
                                          provider.changeAbsence();
                                          provider.setpresenceValue(true);
                                        }),
                                        child: provider.presence
                                            ? CircleAvatar(
                                                radius: 16.0,
                                                backgroundColor:
                                                    ColorManager.gray,
                                                child: Icon(
                                                  Icons.done,
                                                  color: ColorManager.white,
                                                ))
                                            : CircleAvatar(
                                                radius: 16.0,
                                                backgroundColor:
                                                    ColorManager.green,
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
                                          provider.changePresence();
                                          provider.setpresenceValue(false);
                                        }),
                                        child: !provider.absence
                                            ? CircleAvatar(
                                                radius: 16.0,
                                                backgroundColor:
                                                    ColorManager.red,
                                                child: Icon(
                                                  Icons.cancel,
                                                  color: ColorManager.white,
                                                ))
                                            : CircleAvatar(
                                                radius: 16.0,
                                                backgroundColor:
                                                    ColorManager.gray,
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
                                child: Column(
                              children: [
                                Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 12.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        provider.standardRate[0].name!,
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            color: ColorManager.primary,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.remove),
                                            onPressed: () {
                                              final newValue =
                                                  provider.currentIntValue1 - 1;
                                              provider.setcurrentIntValue1(
                                                  newValue.clamp(0, 5));
                                            },
                                          ),
                                          Text('${provider.currentIntValue1}'),
                                          IconButton(
                                            icon: Icon(Icons.add),
                                            onPressed: () {
                                              final newValue =
                                                  provider.currentIntValue1 + 1;
                                              provider.setcurrentIntValue1(
                                                  newValue.clamp(0, 5));
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 12.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        provider.standardRate[1].name!,
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            color: ColorManager.primary,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.remove),
                                            onPressed: () {
                                              final newValue =
                                                  provider.currentIntValue2 - 1;
                                              provider.setcurrentIntValue2(
                                                  newValue.clamp(0, 5));
                                            },
                                          ),
                                          Text('${provider.currentIntValue2}'),
                                          IconButton(
                                            icon: Icon(Icons.add),
                                            onPressed: () {
                                              final newValue =
                                                  provider.currentIntValue2 + 1;
                                              provider.setcurrentIntValue2(
                                                  newValue.clamp(0, 5));
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 12.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        provider.standardRate[2].name!,
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            color: ColorManager.primary,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.remove),
                                            onPressed: () {
                                              final newValue =
                                                  provider.currentIntValue3 - 1;
                                              provider.setcurrentIntValue3(
                                                  newValue.clamp(0, 5));
                                            },
                                          ),
                                          Text('${provider.currentIntValue3}'),
                                          IconButton(
                                            icon: Icon(Icons.add),
                                            onPressed: () {
                                              final newValue =
                                                  provider.currentIntValue3 + 1;
                                              provider.setcurrentIntValue3(
                                                  newValue.clamp(0, 5));
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 12.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        provider.standardRate[3].name!,
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            color: ColorManager.primary,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.remove),
                                            onPressed: () {
                                              final newValue =
                                                  provider.currentIntValue4 - 1;
                                              provider.setcurrentIntValue4(
                                                  newValue.clamp(0, 5));
                                            },
                                          ),
                                          Text('${provider.currentIntValue4}'),
                                          IconButton(
                                            icon: Icon(Icons.add),
                                            onPressed: () {
                                              final newValue =
                                                  provider.currentIntValue4 + 1;
                                              provider.setcurrentIntValue4(
                                                  newValue.clamp(0, 5));
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 12.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        provider.standardRate[4].name!,
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            color: ColorManager.primary,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.remove),
                                            onPressed: () {
                                              final newValue =
                                                  provider.currentIntValue5 - 1;
                                              provider.setcurrentIntValue5(
                                                  newValue.clamp(0, 5));
                                            },
                                          ),
                                          Text('${provider.currentIntValue5}'),
                                          IconButton(
                                            icon: Icon(Icons.add),
                                            onPressed: () {
                                              final newValue =
                                                  provider.currentIntValue5 + 1;
                                              provider.setcurrentIntValue5(
                                                  newValue.clamp(0, 5));
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                            SizedBox(
                              height: 10.h,
                            ),
                            Column(
                              //   mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 12.w),
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
                                  controller: provider.moreDetailsRate,
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
                                            color: ColorManager.borderTextFiel,
                                            width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(12.r)),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.r),
                                      borderSide: BorderSide(
                                          color: ColorManager.primary,
                                          width: 1.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.r),
                                      borderSide: BorderSide(
                                          color: ColorManager.borderTextFiel,
                                          width: 1.0),
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
                                    onpressed: () async {
                                      provider.rats = [];
                                      Map<String, int> rate1 = {
                                        provider.standardRate[0].id!.toString():
                                            provider.currentIntValue1
                                      };
                                      Map<String, int> rate2 = {
                                        provider.standardRate[1].id!.toString():
                                            provider.currentIntValue2
                                      };
                                      Map<String, int> rate3 = {
                                        provider.standardRate[2].id!.toString():
                                            provider.currentIntValue3
                                      };
                                      Map<String, int> rate4 = {
                                        provider.standardRate[3].id!.toString():
                                            provider.currentIntValue4
                                      };
                                      Map<String, int> rate5 = {
                                        provider.standardRate[4].id!.toString():
                                            provider.currentIntValue5
                                      };
                                      provider.rats.add(rate1);
                                      provider.rats.add(rate2);
                                      provider.rats.add(rate3);
                                      provider.rats.add(rate4);
                                      provider.rats.add(rate5);
                                      provider.moreDetailsRate.clear();
                                      try {
                                        print(provider
                                            .studentModel[provider.studentID]
                                            .email!);
                                        print(provider.presence);
                                        print(provider.rats);
                                        print(provider.moreDetailsRate.text);

                                        await provider.StudentEvaluation(
                                            provider
                                                .studentModel[
                                                    provider.studentID]
                                                .email!,
                                            provider.presenceValue,
                                            provider.rats,
                                            provider.moreDetailsRate.text);

                                        print("Done");
                                      } catch (e) {
                                        print("Error");
                                        print(e.toString());
                                      }
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
                    )
                  ],
                ),
              ),
            ),
            connectivityBuilder: (BuildContext context,
                ConnectivityResult connectivity, Widget child) {
              final bool connected = connectivity != ConnectivityResult.none;
              return connected ? child : NoConnectionScreen();
            }),
      );
    });
  }
}
