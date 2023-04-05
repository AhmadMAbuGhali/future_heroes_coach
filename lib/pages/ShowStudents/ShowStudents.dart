import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
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

import '../../main.dart';
import '../../widgets/cardSubscriptionType.dart';
import '../auth/NoConnection.dart';

class ShowStudents extends StatelessWidget {
  const ShowStudents({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, provider, x) {
      return Scaffold(
        body: OfflineBuilder(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Padding(
              padding:  EdgeInsets.only(top: 40.h),
              child: Column(
                children: [
                  Row(
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
                  CustomTextTitle(text: 'طلابي'),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    height: 155.h,
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
                                    provider.classTime[provider.classID].department.toString(),
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
                                          shaedpref.getString("curruntLang") ==
                                              "ar"
                                              ? provider
                                              .daysAr[provider.classTime[provider.classID].day]!
                                              : "${provider.daysEn[
                                          provider.classTime[provider.classID].day]!}  ",
                                        style: TextStyle(
                                          color: ColorManager.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.timelapse,
                                        color: ColorManager.gray,
                                      ),
                                      Text(
                                        "${provider.classTime[provider.classID].startClass}"+" -->" +"${provider.classTime[provider.classID].endClass}",
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
                            radius: 35.r,
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
                            memberLabel: "${"MembershipNo".tr}:"  ,
                            memberNumber: "${provider.studentModel[index].membershipNo}",
                            customerImage:
                                provider.studentModel[index].imageString ??
                                    '3139c8bb-601a-44bd-8242-43d744ce0e76.jpg',
                            ontap: () {
                              provider.getStandardRate();
                              provider.setStudentID(index);
                              Get.toNamed(RouteHelper.performanceEvaluation);
                            },
                          );
                        }),
                  )
                ],
              ),
            ),
          ),
            connectivityBuilder:
                (BuildContext context, ConnectivityResult connectivity, Widget child) {

              final bool connected = connectivity != ConnectivityResult.none;
              return connected?child:NoConnectionScreen();}
        ),
      );
    });
  }
}
