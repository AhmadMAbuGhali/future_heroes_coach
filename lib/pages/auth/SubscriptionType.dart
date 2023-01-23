import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:future_heroes_coach/pages/auth/cardSubscriptionType.dart';
import 'package:future_heroes_coach/resources/assets_manager.dart';
import 'package:future_heroes_coach/resources/color_manager.dart';
import 'package:future_heroes_coach/widgets/CustomButtonPrimary.dart';
import 'package:future_heroes_coach/widgets/CustomTextTitle.dart';
import 'package:future_heroes_coach/widgets/CardCheckBoxWidget.dart';
import 'package:future_heroes_coach/widgets/snakbar.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

import '../../routes/route_helper.dart';

class SubscriptionType extends StatefulWidget {
  const SubscriptionType({super.key});

  @override
  State<SubscriptionType> createState() => _SubscriptionTypeState();
}

class _SubscriptionTypeState extends State<SubscriptionType> {
  bool isSubscriptionType = false;
  bool isChecked = false;
  bool isSelecteOne = false;
  bool isSelectetwo = false;
  bool isSelecteThree = false;
  var price1 = 99.99;
  var price2 = 179.99;
  var price3 = 249.99;

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
          child: Column(children: [
            SizedBox(
              height: 60.h,
            ),
            CustomTextTitle(
              text: 'lastStep'.tr,
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'chosePackage'.tr,
              textAlign: TextAlign.center,
              style: TextStyle(color: ColorManager.gray),
            ),
            SizedBox(
              height: 60.h,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isSelecteOne = true;
                  isSelectetwo = false;
                  isSelecteThree = false;
                });
              },
              child: CardSubscriptionType(
                isSelecte: isSelecteOne,
                title: 'month'.tr,
                description: 'packageDetails'.tr,
                price: '${price1} '+ 'RS'.tr,
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isSelecteOne = false;
                  isSelectetwo = true;
                  isSelecteThree = false;
                });
              },
              child: CardSubscriptionType(
                isSelecte: isSelectetwo,
                title: 'month2'.tr,
                description: 'packageDetails'.tr,
                price: '${price2} '+ 'RS'.tr,
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isSelecteOne = false;
                  isSelectetwo = false;
                  isSelecteThree = true;
                });
              },
              child: CardSubscriptionType(
                isSelecte: isSelecteThree,
                title: 'month3'.tr,
                description: 'packageDetails'.tr,
                price: '${price3}  '+ 'RS'.tr,
              ),
            ),
            Spacer(),
            CustomButtonPrimary(
              text: 'continue'.tr,
              onpressed: () {
                Get.toNamed(RouteHelper.endSignUp);
              },
            )
          ])),
    );
  }
}
