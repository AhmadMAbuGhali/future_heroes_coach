import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:future_heroes_coach/widgets/CustomTextTitle.dart';
import 'package:get/get.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/styles_manager.dart';

class Ratings extends StatelessWidget {
  const Ratings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
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
              height: 20.h,
            ),
            CustomTextTitle(text: "rating".tr),
            Expanded(
                child: ListView.builder(
                    itemCount: 7,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            ExpandablePanel(
                                header: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 3,
                                      backgroundColor: ColorManager.primary,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Container(
                                      width: 25.w,
                                      height: 25.h,
                                      decoration: BoxDecoration(
                                        color: ColorManager.jewelryBG,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: SvgPicture.asset(
                                          IconAssets.stars,
                                          width: 10.w,
                                          height: 10.h,
                                          color: ColorManager.primary,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15.w,
                                    ),
                                    Text(
                                      'ratingTitle'.tr,
                                      style: getBoldStyle(
                                          color: ColorManager.black),
                                    ),
                                  ],
                                ),
                                collapsed: Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 55.w),
                                  // padding:
                                  //     EdgeInsets.symmetric(horizontal: 55.w),
                                  child: Text(
                                    'ratingBodyCosplay'.tr,
                                    softWrap: true,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                expanded: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              IconAssets.calendar,
                                              color: ColorManager.red,
                                            ),
                                            Text(
                                              "01/01/2023",
                                              style: getLightStyle(
                                                  color: ColorManager.red),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              IconAssets.time,
                                              color: ColorManager.green,
                                            ),
                                            Text(
                                              "8:00 ص",
                                              style: getLightStyle(
                                                  color: ColorManager.green),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "ratingAttendeesTitle".tr,
                                          style: getRegularStyle(
                                              color: ColorManager.primary),
                                        ),
                                        Text(
                                          'ratingAttendeesBody'.tr,
                                          style: getMediumStyle(
                                              color: ColorManager.black),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "ratingObligationDressTitle".tr,
                                          style: getRegularStyle(
                                              color: ColorManager.primary),
                                        ),
                                        Text(
                                          'ratingObligationDressBody'.tr,
                                          style: getMediumStyle(
                                              color: ColorManager.black),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "ratingObligationTrainingTitle".tr,
                                          style: getRegularStyle(
                                              color: ColorManager.primary),
                                        ),
                                        Text(
                                          'ratingObligationTrainingBody'.tr,
                                          style: getMediumStyle(
                                              color: ColorManager.black),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'ratingLiteratureAndEthicsTitle'.tr,
                                          style: getRegularStyle(
                                              color: ColorManager.primary),
                                        ),
                                        Text(
                                          'ratingLiteratureAndEthicsBody'.tr,
                                          style: getMediumStyle(
                                              color: ColorManager.black),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "coachNoteTitle".tr,
                                      textAlign: TextAlign.start,
                                      style: getRegularStyle(
                                          color: ColorManager.primary),
                                    ),
                                    Text(
                                      'coachNoteBody'.tr,
                                      textAlign: TextAlign.start,
                                    )
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                )),
                            Divider(
                              thickness: 2,
                              endIndent: 3,
                              height: 2,
                            )
                          ],
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
