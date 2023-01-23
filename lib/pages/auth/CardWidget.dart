import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_coach/resources/color_manager.dart';

class CardWidget extends StatefulWidget {
  String title;
  Function()? onTap;
  Color? color;
  bool? isChecked;
  CardWidget(
      {super.key,
      required this.title,
      this.color = Colors.grey,
      this.onTap,
      this.isChecked});

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
      margin: EdgeInsets.symmetric(vertical: 5.h),
      decoration: BoxDecoration(
          border: Border.all(color: ColorManager.gray),
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(10.r)),
      child: Row(
        children: [
          Text(widget.title),
        ],
      ),
    );
  }
}
