import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:future_heroes_coach/resources/assets_manager.dart';
import 'package:future_heroes_coach/resources/color_manager.dart';
import 'package:future_heroes_coach/routes/route_helper.dart';
import 'package:future_heroes_coach/widgets/CustomButtonPrimary.dart';
import 'package:future_heroes_coach/widgets/CustomTextFormAuth.dart';
import 'package:future_heroes_coach/widgets/CustomTextTitle.dart';
import 'package:future_heroes_coach/widgets/LogoAuth.dart';
import 'package:future_heroes_coach/widgets/CardCheckBoxWidget.dart';
import 'package:future_heroes_coach/widgets/snakbar.dart';
import 'package:future_heroes_coach/widgets/textSignUp.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

class SignUpScreenPart2 extends StatefulWidget {
  const SignUpScreenPart2({super.key});

  @override
  State<SignUpScreenPart2> createState() => _SignUpState();
}

class _SignUpState extends State<SignUpScreenPart2> {
  bool remmberMe = false;
  bool hidePass = true;
  bool isCultural = false;
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return ColorManager.primary;
      }
      return ColorManager.primary;
    }

    return Scaffold(
      backgroundColor: ColorManager.backGround,
      body: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: ListView(
            children: [
              const LogoAuth(),
              SizedBox(
                height: 10.h,
              ),
              CustomTextTitle(
                text: 'welcome'.tr,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'whatCategory'.tr,
                textAlign: TextAlign.center,
                style: TextStyle(color: ColorManager.gray),
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: isCultural
                            ? null
                            : Border.all(
                                color: ColorManager.primary,
                                width: 2,
                              )),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isCultural = false;
                        });
                      },
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            ImageAssets.sport,
                            height: 100.h,
                            width: 100.h,
                          ),
                          Text("sport".tr),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    focusColor: ColorManager.primary,
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      setState(() {
                        isCultural = true;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: isCultural
                              ? Border.all(
                                  color: ColorManager.primary,
                                  width: 2,
                                )
                              : null),
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            ImageAssets.cultural,
                            height: 100.h,
                            width: 100.h,
                          ),
                          Text("cultural".tr)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              isCultural
                  ? Column(
                      children: [
                        CardCheckBoxWidget(
                          isChecked: isChecked,
                          title: 'Sculpture'.tr,
                        ),
                        CardCheckBoxWidget(
                          isChecked: isChecked,
                          title: 'font'.tr,
                        ),
                        CardCheckBoxWidget(
                          isChecked: isChecked,
                          title: 'drawing'.tr,
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        CardCheckBoxWidget(
                          isChecked: isChecked,
                          title: 'Karate'.tr,
                        ),
                        CardCheckBoxWidget(
                          isChecked: isChecked,
                          title: 'taekwondo'.tr,
                        ),
                        CardCheckBoxWidget(
                          isChecked: isChecked,
                          title: 'Gymnastics'.tr,
                        ),
                      ],
                    ),
              CustomButtonPrimary(
                text: 'continue'.tr,
                onpressed: () {
                  snakbarWidget(context,
                          Titel: 'مرحبا بك',
                          Description: 'قم باكمال عملة التسجيل')
                      .Success();
                  Get.offNamed(RouteHelper.termsAndConditions);
                },
              ),
            ],
          )),
    );
  }
}
