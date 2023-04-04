import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_coach/resources/color_manager.dart';
import 'package:provider/provider.dart';

import '../services/app_provider.dart';

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
    return Consumer<AppProvider>(builder: (context, provider, x) {
      return Container();
  });}
}
