import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:future_heroes_coach/resources/assets_manager.dart';
import 'package:future_heroes_coach/resources/color_manager.dart';
import 'package:future_heroes_coach/widgets/CustomButtonPrimary.dart';
import 'package:future_heroes_coach/widgets/CustomTextTitle.dart';
import 'package:future_heroes_coach/widgets/CardCheckBoxWidget.dart';
import 'package:future_heroes_coach/widgets/snakbar.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

import '../../routes/route_helper.dart';

class Diseases extends StatefulWidget {
  const Diseases({super.key});

  @override
  State<Diseases> createState() => _DiseasesState();
}

class _DiseasesState extends State<Diseases> {
  bool isDiseases = true;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return ColorManager.primary;
      }
      return ColorManager.primary;
    }

    return Scaffold(
      backgroundColor: ColorManager.backGround,
      body: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: ListView(children: [
            CustomTextTitle(
              text: 'weAreClose'.tr,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "tellUsDiseases".tr,
              textAlign: TextAlign.center,
              style: TextStyle(color: ColorManager.gray),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  margin: EdgeInsets.symmetric(vertical: 10.h),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: isDiseases
                          ? null
                          : Border.all(
                              color: ColorManager.primary,
                              width: 2,
                            )),
                  child: InkWell(
                      onTap: () {
                        setState(() {
                          isDiseases = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Text(
                          'iHaveDiseases'.tr,
                          textAlign: TextAlign.center,
                        ),
                      )),
                ),
                InkWell(
                  focusColor: ColorManager.primary,
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    setState(() {
                      isDiseases = true;
                    });
                  },
                  child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      margin: EdgeInsets.symmetric(vertical: 5.h),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: isDiseases
                              ? Border.all(
                                  color: ColorManager.primary,
                                  width: 2,
                                )
                              : null),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          'iDontHaveDisease'.tr,
                          textAlign: TextAlign.center,
                        ),
                      )),
                ),
              ],
            ),
            !isDiseases
                ? Column(
                    children: [
                      CustomTextTitle(text: 'choseDisease'.tr),
                      SizedBox(
                        height: 10.h,
                      ),
                      CardCheckBoxWidget(
                        isChecked: isChecked,
                        title: 'diabetes'.tr,
                      ),
                      CardCheckBoxWidget(
                        isChecked: isChecked,
                        title: 'pressure'.tr,
                      ),
                      CardCheckBoxWidget(
                        isChecked: isChecked,
                        title: 'anemia'.tr,
                      ),
                      CardCheckBoxWidget(
                        isChecked: isChecked,
                        title: 'muscleTear'.tr,
                      ),
                      CardCheckBoxWidget(
                        isChecked: isChecked,
                        title: 'heartDisease'.tr,
                      ),
                      CardCheckBoxWidget(
                        isChecked: isChecked,
                        title: 'other'.tr,
                      ),
                    ],
                  )
                : Column(
                    children: [],
                  ),
            CustomButtonPrimary(
              text: 'continue'.tr,
              onpressed: () {
                Get.toNamed(RouteHelper.coachSelection);
              },
            )
          ])),
    );
  }
}
