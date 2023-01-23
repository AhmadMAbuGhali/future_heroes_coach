import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/color_manager.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String hintText;
  final String? labelText;
  final IconData? iconData;

  final TextEditingController? myController;
  final bool? hidepassword;
  Function()? pressSuffixIcon;
  TextInputType? textInputType;

  CustomTextFormAuth(
      {super.key,
      required this.hintText,
      this.labelText,
      this.iconData,
      this.myController,
      this.textInputType,
      this.pressSuffixIcon,
      this.hidepassword});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 15),
          child: TextFormField(
            cursorColor: ColorManager.primary,
            keyboardType: textInputType,
            obscureText: hidepassword ?? false,
            controller: myController,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorManager.primary),
                    borderRadius: BorderRadius.circular(10.r)),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding:
                     EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
                suffixIcon: IconButton(
                  icon: Icon(
                    iconData,
                    //   color: ColorManager.primary,
                  ),
                  onPressed: pressSuffixIcon,
                ),
                hintText: hintText,
                hintStyle: TextStyle(color: ColorManager.gray, fontSize: 13.sp),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r))),
          ),
        ),
      ],
    );
  }
}
