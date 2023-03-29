import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_coach/resources/color_manager.dart';
import 'package:provider/provider.dart';

import '../services/auth_provider.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String hintText;
  final String? labelText;
  final IconData? iconData;

  final TextEditingController? myController;
  final bool? hidepassword;
  Function()? pressSuffixIcon;
  TextInputType? textInputType;
  final Function(String?)? validator;

  CustomTextFormAuth(
      {super.key,
      required this.hintText,
      this.labelText,
      this.iconData,
      this.myController,
      this.textInputType,
      this.pressSuffixIcon,
      this.validator,
      this.hidepassword});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, x) {
      return Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 15),
            child: TextFormField(
              cursorColor: ColorManager.primary,
              keyboardType: textInputType,
              obscureText: hidepassword ?? false,
              controller: myController,
              focusNode: FocusNode(),
              validator: (value) => validator!(value),
              autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    borderRadius: BorderRadius.circular(10.r)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(
                      color: ColorManager.borderTextFiel, width: 1.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: const BorderSide(
                    color: Colors.red,
                    width: 1.0,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
