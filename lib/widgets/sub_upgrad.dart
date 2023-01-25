import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';

import 'cardSubscriptionType.dart';
import '../resources/color_manager.dart';

class SubUpgrade extends StatefulWidget {
  const SubUpgrade({Key? key}) : super(key: key);

  @override
  State<SubUpgrade> createState() => _SubUpgradeState();
}

class _SubUpgradeState extends State<SubUpgrade> {
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

    return Column(
      children: [
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
            price: '${price1} ' + 'RS'.tr,
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
            price: '${price2} ' + 'RS'.tr,
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
            price: '${price3}  ' + 'RS'.tr,
          ),
        ),
      ],
    );
  }
}
