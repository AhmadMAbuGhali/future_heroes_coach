import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:future_heroes_coach/pages/auth/CardWidget.dart';
import 'package:future_heroes_coach/resources/assets_manager.dart';
import 'package:future_heroes_coach/resources/color_manager.dart';
import 'package:future_heroes_coach/widgets/CustomButtonPrimary.dart';
import 'package:future_heroes_coach/widgets/CustomTextTitle.dart';
import 'package:future_heroes_coach/widgets/CardCheckBoxWidget.dart';
import 'package:future_heroes_coach/widgets/snakbar.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

import '../../resources/styles_manager.dart';
import '../../routes/route_helper.dart';

List<String> list = <String>[
  '04:00 - 05:00',
  '01:00 - 02:00',
  '03:00 - 04:00',
];

class CoachSelection extends StatefulWidget {
  const CoachSelection({super.key});

  @override
  State<CoachSelection> createState() => _CoachSelectionState();
}

class _CoachSelectionState extends State<CoachSelection> {
  String dropdownValue = list.first;
  bool isCoachSelection = false;
  final List<String> items = [
    '04:00 - 05:00 ',
    '01:00 - 02:00 ',
    '03:00 - 04:00 ',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGround,
      body: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: ListView(children: [
            CustomTextTitle(
              text: 'choseCoach'.tr,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "choseFavCoach".tr,
              textAlign: TextAlign.center,
              style: TextStyle(color: ColorManager.gray),
            ),
            Text('sportSection'.tr),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: isCoachSelection
                          ? null
                          : Border.all(
                              color: ColorManager.primary,
                              width: 2,
                            )),
                  child: InkWell(
                      onTap: () {
                        setState(() {
                          isCoachSelection = false;
                        });
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/avatar.png',
                            height: 100,
                            width: 100,
                          ),
                          Text(
                            'coach1'.tr,
                            style: getRegularStyle(color: ColorManager.primary),
                          ),

                        ],
                      )),
                ),
                InkWell(
                  focusColor: ColorManager.primary,
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    setState(() {
                      isCoachSelection = true;
                    });
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          border: isCoachSelection
                              ? Border.all(
                                  color: ColorManager.primary,
                                  width: 2,
                                )
                              : null),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/avatar.png',
                            height: 100,
                            width: 100,
                          ),
                          Text(
                            'coach2'.tr,
                           style: getRegularStyle(color: ColorManager.primary),
                          ),

                        ],
                      )),
                ),
              ],
            ),
            isCoachSelection
                ? Column(
                    children: [
                      Text(
                        'coachClassDay'.tr,
                        style: TextStyle(color: ColorManager.black),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CardWidget(
                        title: 'ClassDays'.tr,
                      ),
                      Text(
                        'availableTime'.tr,
                        style: TextStyle(color: ColorManager.black),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 15.w),
                        margin: EdgeInsets.symmetric(vertical: 5.h),
                        decoration: BoxDecoration(
                            border: Border.all(color: ColorManager.gray),
                            color: ColorManager.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: DropdownButton<String>(
                          value: dropdownValue,
                          elevation: 16,
                          style: const TextStyle(color: ColorManager.primary),
                          underline: Container(
                            height: 2,
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              dropdownValue = value!;
                            });
                          },
                          items: list
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [],
                  ),
            CustomButtonPrimary(
              text: 'continue'.tr,
              onpressed: () {
                Get.toNamed(RouteHelper.subscriptionType);
              },
            )
          ])),
    );
  }
}
