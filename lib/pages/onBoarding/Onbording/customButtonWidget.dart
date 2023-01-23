import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_coach/pages/onBoarding/Onbording/onboarding_controller.dart';
import 'package:future_heroes_coach/resources/color_manager.dart';
import 'package:future_heroes_coach/widgets/CustomButtonPrimary.dart';
import 'package:get/get.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  String text;
  Color textColor;
  Color buttonColor;
  CustomButtonOnBoarding(
      {super.key,
      required this.text,
      required this.textColor,
      required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomButtonPrimary(
        text: text,
        textColor: textColor,
        buttonColor: buttonColor,
        onpressed: () {
          controller.next();
        },
      ),
      //   MaterialButton(
      //     // padding: EdgeInsets.symmetric(horizontal: 100, vertical: 0),
      //     onPressed: () {
      //       controller.next();
      //     },

      //     textColor: textColor,
      //     color: buttonColor,
      //     child: Text(text),
      //   ),
    );
  }
}
