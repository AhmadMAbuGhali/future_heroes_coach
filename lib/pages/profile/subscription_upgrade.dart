import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_coach/routes/route_helper.dart';
import 'package:future_heroes_coach/widgets/CustomButtonPrimary.dart';
import 'package:future_heroes_coach/widgets/CustomTextTitle.dart';
import 'package:future_heroes_coach/widgets/sub_upgrad.dart';
import 'package:get/get.dart';

import '../../resources/color_manager.dart';
import '../../resources/styles_manager.dart';

class SubscriptionUpgrade extends StatelessWidget {
  const SubscriptionUpgrade({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                top: 45.h,
                left: 20.w,
                right: 20.w,
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
            CustomTextTitle(text: 'subscriptionUpgrade'.tr),
            SubUpgrade(),
            CustomButtonPrimary(
                text: 'ConfirmUpgrade'.tr,
                onpressed: () {
                  Get.toNamed(RouteHelper.subscriptionUpgradeSuccessfully);
                })
          ],
        ),
      ),
    );
  }
}
