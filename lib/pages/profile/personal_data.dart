import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_coach/data/api/apiconst.dart';
import 'package:future_heroes_coach/resources/color_manager.dart';
import 'package:future_heroes_coach/widgets/CustomTextTitle.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import '../../resources/assets_manager.dart';
import '../../resources/styles_manager.dart';
import '../../routes/route_helper.dart';
import '../../services/app_provider.dart';
import '../../services/shared_preference_helper.dart';
import '../../widgets/CustomButtonPrimary.dart';
import '../../widgets/CustomTextFormAuth.dart';
import '../auth/NoConnection.dart';

class PersonalData extends StatefulWidget {
  PersonalData({Key? key}) : super(key: key);

  @override
  State<PersonalData> createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> {
  File? imageFile;
  TextEditingController? name = TextEditingController();
  bool hidePass = true;
  TextEditingController dateInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, provider, x) {
      return Scaffold(
        backgroundColor: ColorManager.backGround,
        body: OfflineBuilder(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Padding(
              padding: EdgeInsets.only(top: 40.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: () async {
                                Get.back();
                                await provider.getComplaintReplay();
                                await provider.getProfileData();
                                await provider.getUserNotification();
                                await provider.getClassTime();
                                await provider.getOrderReplay();

                              },
                              icon: const Icon(
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
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'personalDetails'.tr,
                        style: getBoldStyle(color: ColorManager.black),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 10.h,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 90.h,
                        width: 90.w,
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
                                  : provider.imageFile == null
                                  ? Image.network(
                                ApiConstant.imageURL +
                                    provider
                                        .profileData!.imageString!,
                                fit: BoxFit.cover,
                              ).image
                                  : Image.file(
                                provider.imageFile!,
                                fit: BoxFit.cover,
                              ).image,
                              backgroundImage:
                              provider.profileData!.imageString == null
                                  ? Image.asset(
                                ImageAssets.avatar,
                              ).image
                                  : provider.imageFile == null
                                  ? Image.network(
                                ApiConstant.imageURL +
                                    provider
                                        .profileData!.imageString!,
                                fit: BoxFit.cover,
                              ).image
                                  : Image.file(
                                provider.imageFile!,
                                fit: BoxFit.cover,
                              ).image,
                            ),
                            Positioned(
                                bottom: -5.h,
                                right: -30.w,
                                child: RawMaterialButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (builder) => bottomSheet(),
                                    );
                                  },
                                  elevation: 2.0,
                                  fillColor: const Color(0xFFF5F6F9),
                                  padding: const EdgeInsets.all(5.0),
                                  shape: const CircleBorder(),
                                  child: const Icon(
                                    Icons.camera_alt_outlined,
                                    color: Colors.blue,
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    'email'.tr,
                    style: getRegularStyle(color: Colors.black),
                  ),
                  // const SizedBox(
                  //   height: 5,
                  // ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    width: double.infinity,
                    height: 44.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: ColorManager.gray, width: 1)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              provider.profileData!.email ?? "",
                              style: getRegularStyle(color: ColorManager.gray),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'userName'.tr,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),

                  Container(
                    width: double.infinity,
                    height: 44.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: ColorManager.gray, width: 1)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              provider.profileData!.fullName ?? "",
                              style: getRegularStyle(color: ColorManager.gray),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'DOB'.tr,
                    style: TextStyle(fontSize: 12.sp),
                  ),
                  // const SizedBox(
                  //   height: 5,
                  // ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    width: double.infinity,
                    height: 44.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: ColorManager.gray, width: 1)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              provider.profileData!.dateOfBirth!
                                  .split("T")
                                  .first,
                              style: getRegularStyle(color: ColorManager.gray),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'mobileNumber'.tr,
                    style: TextStyle(fontSize: 12.sp),
                  ),
                  // const SizedBox(
                  //   height: 5,
                  // ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    width: double.infinity,
                    height: 44.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: ColorManager.gray, width: 1)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              provider.profileData!.phoneNumber ?? "",
                              style: getRegularStyle(color: ColorManager.gray),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),

                  CustomButtonPrimary(
                    text: "save".tr,
                    onpressed: () async {
                      try {
                        await provider.updateImage(provider.imageFile!);

                      } catch (e) {
                      }
                    },
                  ),

                  SizedBox(
                    height: 15.h,
                  ),
                  SizedBox(
                    width: double.infinity,

                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorManager.white,
                          side: const BorderSide(color: ColorManager.primary,width: 1),
                          shape:
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          textStyle: TextStyle(
                            fontFamily: 'DroidKufi',
                            fontSize: 16.sp,
                          ),
                        ),
                        onPressed: () async{
                          await provider.getComplaintReplay();
                          await provider.getProfileData();
                          await provider.getUserNotification();
                          await provider.getClassTime();
                          await provider.getOrderReplay();
                          Get.toNamed(RouteHelper.changePassword);
                        },
                        child: Text("changePassword".tr,style: getRegularStyle(color: ColorManager.primary),)),
                  ),

                ],
              ),
            ),
          ),
          connectivityBuilder:
              (BuildContext context, ConnectivityResult connectivity, Widget child) {

            final bool connected = connectivity != ConnectivityResult.none;
            return connected?child:NoConnectionScreen();


          },
        ),
      );
    });
  }



  Widget bottomSheet() {
    return Consumer<AppProvider>(builder: (context, provider, x) {
      return Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30))),
        height: 220.h,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'changePhoto'.tr,
            ),
            SizedBox(
              height: 20,
            ),
            CustomButtonPrimary(
                text: "openCamera".tr,
                onpressed: () {
                  provider.openCamera(context);
                }),
            SizedBox(
              height: 10.h,
            ),
            Text("or".tr),
            CustomButtonPrimary(
                text: "openGallery".tr,
                onpressed: () {
                  provider.openGallery(context);
                }),
          ],
        ),
      );
    });
  }
}
