import 'dart:io';

import 'package:flutter/material.dart';
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
      return SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await provider.getProfileData();
          },
          child: Scaffold(
            backgroundColor: ColorManager.backGround,
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
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

                  Center(
                      child: CustomTextTitle(
                    text: 'personalDetails'.tr,
                  )),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                            Positioned(
                                bottom: -10.h,
                                right: -35.w,
                                child: RawMaterialButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (builder) => bottomSheet(),
                                    );
                                  },
                                  elevation: 2.0,
                                  fillColor: Color(0xFFF5F6F9),
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                    color: Colors.blue,
                                  ),
                                  padding: EdgeInsets.all(5.0),
                                  shape: CircleBorder(),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 15.h,
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
                    style: TextStyle(
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
                                      .first ??
                                  "",
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
                              provider.profileData!.phoneNumber ?? '',
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
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomButtonPrimary(
                    text: "changePassword".tr,
                    onpressed: () {
                      print({getIt<SharedPreferenceHelper>().getUserToken()});
                      Get.toNamed(RouteHelper.changePassword);
                    },
                  ),
                  CustomButtonPrimary(
                    text: "save".tr,
                    onpressed: () {
                      provider.updateImage(imageFile!);
                      print(imageFile.toString());
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  Future _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );

    if (pickedFile != null) {
      // File imageFile = File(pickedFile.path);
      final imageTemp = File(pickedFile.path);
      setState(() => this.imageFile = imageTemp);
    }
  }

  Future _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );

    if (pickedFile != null) {
      // File imageFile = File(pickedFile.path);
      final imageTemp = File(pickedFile.path);
      setState(() => this.imageFile = imageTemp);
    }
  }

  Widget bottomSheet() {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30))),
      height: 200.h,
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
          ElevatedButton(
            onPressed: () {
              setState(() {
                _getFromCamera();
                Navigator.pop(context);
              });
            },
            child: Text('openCamera'.tr),
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorManager.primary,
              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 5),
            ),
          ),
          SizedBox(
            height: 7.h,
          ),
          Text('or'.tr),
          SizedBox(
            height: 7.h,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _getFromGallery();
                Navigator.pop(context);
              });
            },
            child: Text('openGallery'.tr),
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorManager.primary,
              padding: EdgeInsets.symmetric(horizontal: 95, vertical: 5),
            ),
          ),
        ],
      ),
    );
  }
}
