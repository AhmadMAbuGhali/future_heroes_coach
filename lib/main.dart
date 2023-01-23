import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_coach/routes/route_helper.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'locale/locale.dart';
import 'locale/locale_controller.dart';

late SharedPreferences shaedpref;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  shaedpref = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    MyLocalController controller = Get.put(MyLocalController());
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            locale: shaedpref.getString("curruntLang") == null
                ? Get.deviceLocale
                : Locale(shaedpref.getString("curruntLang")!),
            translations: MyLocale(),
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: 'DroidKufi',
              primaryColor: Color(0xFF8A57DC),
            ),
            initialRoute: RouteHelper.getSplashScreen(),
            getPages: RouteHelper.routes,
          );
        });
  }
}
