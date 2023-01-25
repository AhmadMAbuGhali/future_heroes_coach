import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_coach/resources/color_manager.dart';

class PlusWidget extends StatefulWidget {
  String title;
  PlusWidget({super.key, required this.title});

  @override
  State<PlusWidget> createState() => _PlusWidgetState();
}

class _PlusWidgetState extends State<PlusWidget> {
  int _currentIntValue = 5;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title,
            style: TextStyle(
                fontSize: 12.sp,
                color: ColorManager.primary,
                fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () => setState(() {
                  final newValue = _currentIntValue - 1;
                  _currentIntValue = newValue.clamp(0, 5);
                }),
              ),
              Text('$_currentIntValue'),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () => setState(() {
                  final newValue = _currentIntValue + 1;
                  _currentIntValue = newValue.clamp(0, 5);
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
