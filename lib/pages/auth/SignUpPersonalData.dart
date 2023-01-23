import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:future_heroes_coach/resources/assets_manager.dart';
import 'package:future_heroes_coach/resources/color_manager.dart';
import 'package:future_heroes_coach/routes/route_helper.dart';
import 'package:future_heroes_coach/widgets/CustomButtonPrimary.dart';
import 'package:future_heroes_coach/widgets/CustomTextFormAuth.dart';
import 'package:future_heroes_coach/widgets/CustomTextTitle.dart';
import 'package:future_heroes_coach/widgets/LogoAuth.dart';
import 'package:future_heroes_coach/widgets/snakbar.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class SignUpPersonalData extends StatefulWidget {
  const SignUpPersonalData({super.key});

  @override
  State<SignUpPersonalData> createState() => _SignUpPersonalDataState();
}

class _SignUpPersonalDataState extends State<SignUpPersonalData> {
  File? imageFile;

  bool hidePass = true;
  TextEditingController dateTextInput = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.backGround,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 60.h,
              ),
              Center(
                child: CustomTextTitle(
                  text: 'personalDetails'.tr,
                ),
              ),
                  Center(
                    child: SizedBox(
                      height: 100.h,
                      width: 100.w,
                      child: Stack(
                        clipBehavior: Clip.none,
                        fit: StackFit.expand,
                        children: [
                          CircleAvatar(
                            foregroundImage: imageFile == null
                                ? Image.asset(
                              ImageAssets.avatar,
                            ).image
                                : Image.file(
                              imageFile!,
                              fit: BoxFit.cover,
                            ).image,
                            backgroundImage: imageFile == null
                                ? Image.asset(
                              ImageAssets.avatar,
                            ).image
                                : Image.file(
                              imageFile!,
                              fit: BoxFit.cover,
                            ).image,
                          ),
                          Positioned(
                              bottom: -7.h,
                              right: -15.w,
                              child: RawMaterialButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (builder) => bottomSheet(),
                                  );
                                },
                                elevation: 2.0,
                                fillColor: Color(0xFFF5F6F9),
                                child: Icon(Icons.camera_alt_outlined, color: Colors.blue,),
                                padding: EdgeInsets.all(5.0),
                                shape: CircleBorder(),
                              )),
                        ],
                      ),
                    ),
                  ),

              const SizedBox(
                height: 30,
              ),
               Text(
                'email'.tr,
                style: TextStyle(fontSize: 12),
              ),
              // const SizedBox(
              //   height: 5,
              // ),
              CustomTextFormAuth(
                hidepassword: false,
                textInputType: TextInputType.emailAddress,

                hintText: 'email'.tr,
                //  labelText: 'البريد الالكتروني / رقم الهاتف',
                //  iconData: Icons.email_outlined,
              ),
              //  const SizedBox(
              //     height: 10,
              //   ),
               Text(
                'password'.tr,
                style: TextStyle(fontSize: 12),
              ),

              CustomTextFormAuth(
                textInputType: TextInputType.visiblePassword,
                hidepassword: hidePass,
                pressSuffixIcon: () {
                  setState(() {
                    hidePass = !hidePass;
                  });
                },
                hintText: 'password'.tr,
                // labelText: 'كلمة المرور',
                iconData: hidePass ? Icons.visibility : Icons.visibility_off,
              ),
               Text(
                'userName'.tr,
                style: TextStyle(fontSize: 12),
              ),
              // const SizedBox(
              //   height: 5,
              // ),
              CustomTextFormAuth(
                hidepassword: false,
                textInputType: TextInputType.emailAddress,

                hintText: 'userName'.tr,

                //  labelText: 'البريد الالكتروني / رقم الهاتف',
                //  iconData: Icons.email_outlined,
              ),
               Text(
                'DOB'.tr,
                style: TextStyle(fontSize: 12),
              ),
              // const SizedBox(
              //   height: 5,
              // ),
              CustomTextFormAuth(
                myController: dateTextInput,
                pressSuffixIcon: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      lastDate: DateTime(2100));
                  if (pickedDate != null) {
                    print(pickedDate);
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                    print(formattedDate);
                    setState(() {
                      dateTextInput.text =
                          formattedDate; //set output date to TextField value.
                    });
                  } else {}
                },
                hintText: 'YYYY/MM/DD',
                iconData: Icons.calendar_month_outlined,
              ),
               Text(
                'mobileNumber'.tr,
                style: TextStyle(fontSize: 12),
              ),
              // const SizedBox(
              //   height: 5,
              // ),
              CustomTextFormAuth(
                hidepassword: false,
                textInputType: TextInputType.number,
                iconData: Icons.phone,
                hintText: 'mobileNumber'.tr,
                //  labelText: 'البريد الالكتروني / رقم الهاتف',
                //  iconData: Icons.email_outlined,
              ),
              CustomButtonPrimary(
                text: 'continue'.tr,
                onpressed: () {
                  Get.toNamed(RouteHelper.diseases);
                },
              ),
            ]),
          ),
        ));
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
      height: 220.h,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            'changePhoto'.tr,
          ),
          SizedBox(
            height: 8.h,
          ),
          CustomButtonPrimary(
              text: "openCamera".tr,
              onpressed: () {
                setState(() {
                  _getFromCamera();
                  Navigator.pop(context);
                });
              }),
          SizedBox(height: 10.h,),
          Text("or".tr),
          CustomButtonPrimary(
              text: "openGallery".tr,
              onpressed: () {
                setState(() {
                  _getFromGallery();
                  Navigator.pop(context);
                });
              }),
        ],
      ),
    );
  }
}
