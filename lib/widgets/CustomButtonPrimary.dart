import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/color_manager.dart';
import '../resources/styles_manager.dart';


class CustomButtonPrimary extends StatelessWidget {
  final String text;
  final void Function() onpressed;
  Color? textColor;
  Color? buttonColor;

  CustomButtonPrimary(
      {super.key,
      required this.text,
      required this.onpressed,
      this.textColor = Colors.white,
      this.buttonColor = ColorManager.primary});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin:  EdgeInsets.only(top: 10.h),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
          foregroundColor: ColorManager.white,
          side: BorderSide(color: ColorManager.primary),
          padding:  EdgeInsets.symmetric(vertical: 10.h),
          primary: buttonColor,
          textStyle: TextStyle(
            fontFamily: 'DroidKufi',
            fontSize: 16.sp,
          ),
        ),
        onPressed: onpressed,
        child: Text(
          text,
          style: getRegularStyle(color: textColor!),
        ),
      ),
    );
  }
}
