import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_coach/data/api/apiconst.dart';
import 'package:future_heroes_coach/resources/assets_manager.dart';
import 'package:future_heroes_coach/resources/color_manager.dart';
import 'package:future_heroes_coach/resources/styles_manager.dart';
import 'package:future_heroes_coach/routes/route_helper.dart';
import 'package:future_heroes_coach/services/app_provider.dart';
import 'package:future_heroes_coach/widgets/class_time_widget.dart';
import 'package:future_heroes_coach/widgets/dateWidget.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var numberOfDone = 3;
  bool isExpanded = true;
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, provider, x) {
      return RefreshIndicator(
        onRefresh: () async {
          await provider.getClassTime();
        },
        child: Scaffold(
          backgroundColor: ColorManager.backGround,
          body: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 270,
                  width: double.infinity,
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: new AssetImage(ImageAssets.mainImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40.h,
                      ),
                      CircleAvatar(
                        radius: 50.r,
                        foregroundImage:
                            provider.profileData!.imageString == null
                                ? Image.asset(
                                    ImageAssets.avatar,
                                  ).image
                                : Image.network(
                                    ApiConstant.imageURL +
                                        provider.profileData!.imageString!,
                                    fit: BoxFit.cover,
                                  ).image,
                        backgroundImage:
                            provider.profileData!.imageString == null
                                ? Image.asset(
                                    ImageAssets.avatar,
                                  ).image
                                : Image.network(
                                    ApiConstant.imageURL +
                                        provider.profileData!.imageString!,
                                    fit: BoxFit.cover,
                                  ).image,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "homeTopText1".tr + provider.profileData!.fullName!,
                        style: getRegularStyle(color: ColorManager.white),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text("numberOfPostponement".tr + " ${numberOfDone}",
                          style: getRegularStyle(color: ColorManager.white)),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Divider(
                            thickness: 1,
                            color: ColorManager.white,
                            endIndent: 1,
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text("homeTopText2".tr,
                                  style: getRegularStyle(
                                      color: ColorManager.white, fontSize: 11)),
                              // Text("homeTopText3".tr,
                              //     style: getRegularStyle(
                              //         color: ColorManager.white, fontSize: 11)),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: 280.h,
                  left: 20,
                  right: 20,
                  bottom: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 500.h,
                      child: ListView.builder(
                          itemCount: provider.classTime.length,
                          itemBuilder: (context, index) {
                            return DateWidget(
                              timeStart: provider.classTime[index].startClass,
                              timeEnd: provider.classTime[index].endClass,
                              date: provider.classTime[index].dayAsString,
                              type: provider.classTime[index].department,
                              onTapReq: () {
                                provider.setId(provider.classTime[index].id!);
                                print(provider.id);
                                Get.toNamed(RouteHelper.postponeAnAppointment);
                              },
                              onTapShow: () {
                                provider.setId(provider.classTime[index].id!);
                                provider.getStudentsClass(
                                    provider.classTime[index].id!);
                                print(provider.id);
                                Get.toNamed(RouteHelper.showStudents);
                              },
                            );
                          }),
                    ),
                  )),
            ],
          ),
        ),
      );
    });
  }
}
