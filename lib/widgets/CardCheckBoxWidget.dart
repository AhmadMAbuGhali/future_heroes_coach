import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/color_manager.dart';

class CardCheckBoxWidget extends StatefulWidget {
  String title;
  Function()? onTap;
  Color? color;
  bool? isChecked;
  CardCheckBoxWidget(
      {super.key,
      required this.title,
      this.color = Colors.grey,
      this.onTap,
      this.isChecked});

  @override
  State<CardCheckBoxWidget> createState() => _CardCheckBoxWidgetState();
}

class _CardCheckBoxWidgetState extends State<CardCheckBoxWidget> {
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

    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.h),
      decoration: BoxDecoration(
          border: Border.all(color: ColorManager.gray),
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(10.r)),
      child: Row(
        children: [
          Checkbox(
            checkColor: Colors.white,
            fillColor: MaterialStateProperty.resolveWith(getColor),
            value: widget.isChecked,
            onChanged: (bool? value) {
              setState(() {
                widget.isChecked = value!;
              });
            },
          ),
          Text(widget.title),
        ],
      ),
    );
  }
}
