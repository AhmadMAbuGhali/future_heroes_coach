import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../resources/assets_manager.dart';
import '../resources/styles_manager.dart';

class ProfileSection extends StatelessWidget {
  final String label;
  final bool haveArrow;
  final String icon;
  final Function() onTap;
  Color? myColor;
   ProfileSection({Key? key, required this.label, required this.haveArrow, required this.icon, required this.onTap,this.myColor=Colors.black}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(icon,color: myColor!,width: 15.w,height: 15.h,),
              SizedBox(
                width: 5.w,
              ),
              Text(
              label,
              style: getBoldStyle(color: myColor!, fontSize: 12.sp),
            ),
              const Spacer(),
              haveArrow?Icon(Icons.arrow_forward_ios_outlined,size: 15.w,):Container(),




            ],
          ),
        ),
        SizedBox(
          height: 7.h,
        ),
        const Divider(
          height: 1,
          thickness: 1,
          endIndent: 2,
        ),
        SizedBox(
          height: 7.h,
        ),
      ],
    );
  }
}
