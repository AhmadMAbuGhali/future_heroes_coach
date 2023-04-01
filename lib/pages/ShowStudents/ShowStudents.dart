import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                            provider.classTime[1].id.toString() ?? '',
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
                                    '13-01-2023',
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
                                child: Image.asset(
                                  ImageAssets.avatar,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.w, vertical: 5.h),
                                child: Column(
                                  children: [
                                    Text(
                                      provider.profileData!.fullName ?? '',
                                      style: TextStyle(
                                          color: ColorManager.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      provider.classTime[0].department ?? '',
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
                      SvgPicture.asset(ImageAssets.Taekwondo_pictogram)
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
