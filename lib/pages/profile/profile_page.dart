import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:future_heroes_coach/data/api/api_client.dart';
import 'package:future_heroes_coach/pages/auth/login.dart';
import 'package:future_heroes_coach/resources/color_manager.dart';
import 'package:future_heroes_coach/routes/route_helper.dart';
import 'package:future_heroes_coach/services/app_provider.dart';
import 'package:future_heroes_coach/widgets/profile_section.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/api/apiconst.dart';
import '../../resources/assets_manager.dart';
import '../../resources/styles_manager.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? imageFile;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, provider, x) {
      Future<void> _logoutDialog() async {
        return showDialog<void>(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0))),

              title: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        IconAssets.alert,
                        color: Colors.red,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
              content: SingleChildScrollView(
                child: ListBody(
                  children: [
                    Text('logoutPopUpText'.tr),
                  ],
                ),
              ),
              actions: <Widget>[
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final prefs = await SharedPreferences.getInstance();
                        await prefs.clear();
                        DioClient.dioClient.signout();
                        provider.logOut();
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => Login()),
                            (Route<dynamic> route) => false);
                        //   RouteHelper.NavigateWithReplacemtnToWidget();
                        //  Get.offAndToNamed(RouteHelper.login);
                      },
                      child: Container(
                        width: 100.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.red)),
                        child: Center(
                            child: Text(
                          'yes'.tr,
                          style: getBoldStyle(color: Colors.white),
                        )),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        width: 100.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                            color: ColorManager.white,
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(color: Colors.red)),
                        child: Center(
                            child: Text(
                          'cancel'.tr,
                          textAlign: TextAlign.center,
                          style: getBoldStyle(
                            color: Colors.red,
                          ),
                        )),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            );
          },
        );
      }

      return Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 80.h,
                    width: 80.w,
                    child: Stack(
                      clipBehavior: Clip.none,
                      fit: StackFit.expand,
                      children: [
                        CircleAvatar(
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
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    provider.profileData!.fullName!,
                    style: getBoldStyle(color: Colors.black),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    provider.profileData!.email!,
                    style: getRegularStyle(color: Colors.black),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Text(
                  //       "playerLevel".tr,
                  //       style: getBoldStyle(color: Colors.black, fontSize: 12),
                  //     ),
                  //     Text(
                  //       "Beginner".tr,
                  //       style: getRegularStyle(color: ColorManager.primary),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(
                    height: 40.h,
                  ),
                  //معلومات الشخصية
                  ProfileSection(
                      label: "personalDetails".tr,
                      haveArrow: true,
                      icon: IconAssets.user,
                      onTap: () {
                        Get.toNamed(RouteHelper.personalData);
                      }),

                  //الطلبات والشكاوي
                  // ProfileSection(
                  //     label: "requestsAndComplaints".tr,
                  //     haveArrow: true,
                  //     icon: IconAssets.paper,
                  //     onTap: () {
                  //       Get.toNamed(RouteHelper.requestsAndComplaints);
                  //     }),

                  //مواعيد التدريب
SizedBox(height: 20.h,),
                  ProfileSection(
                      label: "classTime".tr,
                      haveArrow: true,
                      icon: IconAssets.calendar,
                      onTap: () {
                        Get.toNamed(RouteHelper.classTime);
                      }),
                  SizedBox(height: 20.h,),

                  //ترقية الاشتراك
                  // ProfileSection(
                  //     label: "subscriptionUpgrade".tr,
                  //     haveArrow: true,
                  //     icon: IconAssets.jewelry,
                  //     onTap: () {
                  //       Get.toNamed(RouteHelper.subscriptionUpgrade);
                  //     }),

                  //تاجيل موعد حجز

                  // ProfileSection(
                  //     label: "ShowStudents".tr,
                  //     haveArrow: true,
                  //     icon: IconAssets.user_ninja,
                  //     onTap: () {
                  //       Get.toNamed(RouteHelper.showStudents);
                  //     }),

                  //اللغة
                  ProfileSection(
                      label: "language".tr,
                      haveArrow: true,
                      icon: IconAssets.language,
                      onTap: () {
                        Get.toNamed(RouteHelper.language);
                      }),
                  SizedBox(height: 20.h,),

                  //تسجيل الخروج
                  ProfileSection(
                      label: "logout".tr,
                      haveArrow: false,
                      icon: IconAssets.user,
                      myColor: Colors.red,
                      onTap: () {
                        _logoutDialog();
                      }),
                  SizedBox(height: 20.h,),

                  //حذف الحساب
                  ProfileSection(
                      label: "deleteAccount".tr,
                      haveArrow: false,
                      icon: IconAssets.delete,
                      myColor: Colors.red,
                      onTap: () {
                        _deleteAccountDialog();
                      }),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }


  Future<void> _deleteAccountDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0))),

          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                IconAssets.alert,
                color: Colors.red,
              ),
              // GestureDetector(
              //     onTap: () {
              //       Navigator.of(context).pop();
              //     },
              //     child: Icon(
              //       Icons.cancel,
              //       color: Colors.red,
              //     ))
            ],
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('deleteAccountTextTitle'.tr),
              ],
            ),
          ),
          actions: <Widget>[
            Column(
              children: [
                Text('deleteAccountTextBody'.tr),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        width: 100.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.red)),
                        child: Center(
                            child: Text(
                          'yes'.tr,
                          style: getBoldStyle(color: Colors.white),
                        )),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        width: 100.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.red)),
                        child: Center(
                            child: Text(
                          'cancel'.tr,
                          textAlign: TextAlign.center,
                          style: getBoldStyle(
                            color: Colors.red,
                          ),
                        )),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
