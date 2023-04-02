import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:future_heroes_coach/data/api/apiconst.dart';
import 'package:future_heroes_coach/resources/assets_manager.dart';
import 'package:future_heroes_coach/resources/color_manager.dart';
import 'package:future_heroes_coach/resources/styles_manager.dart';
import 'package:future_heroes_coach/routes/route_helper.dart';
import 'package:future_heroes_coach/services/app_provider.dart';
import 'package:future_heroes_coach/widgets/CustomButtonPrimary.dart';
import 'package:future_heroes_coach/widgets/CustomTextTitle.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../widgets/cardSubscriptionType.dart';

class ShowStudents extends StatelessWidget {
  const ShowStudents({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, provider, x) {
      return Scaffold(
        body: Padding(
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
                              Get.toNamed(RouteHelper.initial);
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
              CustomTextTitle(text: 'طلابي'),
              SizedBox(
                height: 15.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                height: 150.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: ColorManager.primary),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //  mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'class'.tr +
                                provider.classTime[1].department.toString(),
                            style: TextStyle(
                                color: ColorManager.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.date_range,
                                    color: ColorManager.gray,
                                  ),
                                  Text(
                                    provider.classTime[0].dayAsString ?? '',
                                    style: TextStyle(
                                      color: ColorManager.white,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.timelapse,
                                    color: ColorManager.gray,
                                  ),
                                  Text(
                                    '10:30 - 11:30 ',
                                    style: TextStyle(
                                      color: ColorManager.white,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                foregroundImage:
                                    provider.profileData!.imageString == null
                                        ? Image.asset(
                                            ImageAssets.avatar,
                                          ).image
                                        : Image.network(
                                            ApiConstant.imageURL +
                                                provider
                                                    .profileData!.imageString!,
                                            fit: BoxFit.cover,
                                          ).image,
                                backgroundImage:
                                    provider.profileData!.imageString == null
                                        ? Image.asset(
                                            ImageAssets.avatar,
                                          ).image
                                        : Image.network(
                                            ApiConstant.imageURL +
                                                provider
                                                    .profileData!.imageString!,
                                            fit: BoxFit.cover,
                                          ).image,
                              ),
                              SizedBox(
                                width: 16.w,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.w, vertical: 10.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      provider.profileData!.fullName ?? '',
                                      style: TextStyle(
                                          color: ColorManager.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      provider.profileData!.email ?? '',
                                      style: TextStyle(
                                        color: ColorManager.white,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: 40.r,
                        foregroundImage:
                            provider.profileData!.imageStringSubCatogrey == null
                                ? Image.asset(
                                    ImageAssets.avatar,
                                  ).image
                                : Image.network(
                                    ApiConstant.imageURL +
                                        provider.profileData!
                                            .imageStringSubCatogrey!,
                                    fit: BoxFit.cover,
                                  ).image,
                        backgroundImage:
                            provider.profileData!.imageStringSubCatogrey == null
                                ? Image.asset(
                                    ImageAssets.avatar,
                                  ).image
                                : Image.network(
                                    ApiConstant.imageURL +
                                        provider.profileData!
                                            .imageStringSubCatogrey!,
                                    fit: BoxFit.cover,
                                  ).image,
                      ),
                    ]),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: provider.studentModel.length,
                    itemBuilder: (context, index) {
                      return CardCustomers(
                        name: provider.studentModel[index].fullName!,
                        DOB: provider.studentModel[index].membershipNo ?? '',
                        customerImage:
                            provider.studentModel[index].imageString ?? '',
                        ontap: () {
                          provider.getStandardRate();
                          Get.toNamed(RouteHelper.performanceEvaluation);
                        },
                      );
                    }),
              )
            ],
          ),
        ),
      );
    });
  }
}
