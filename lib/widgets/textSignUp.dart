import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../resources/color_manager.dart';
import '../resources/styles_manager.dart';

class CustomTextSignUpOrSignin extends StatelessWidget {
  final String textone;
  final String texttwo;
  final void Function() onTap;

  const CustomTextSignUpOrSignin(
      {super.key, required this.textone, required this.texttwo, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(textone),
        InkWell(
          onTap: onTap,
          child: Text(
            texttwo,
            style: getBoldStyle(color: ColorManager.primary,fontSize: 12.sp) ),
        )
      ],
    );
  }
}
