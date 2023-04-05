import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_coach/locale/locale_controller.dart';
import 'package:future_heroes_coach/resources/color_manager.dart';
import 'package:future_heroes_coach/widgets/CustomButtonPrimary.dart';
import 'package:get/get.dart';

import '../../resources/strings_manager.dart';
import '../../resources/styles_manager.dart';
import '../../widgets/CustomTextTitle.dart';
import '../auth/NoConnection.dart';

class Language extends StatelessWidget {
  const Language({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyLocalController controllerLang = Get.find();
    return Scaffold(
      backgroundColor: ColorManager.backGround,
      body: OfflineBuilder(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Padding(
            padding:  EdgeInsets.only(top: 40.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              color: ColorManager.primary,
                            )),
                        Text(
                          "user".tr,
                          style: getBoldStyle(color: ColorManager.primary),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 40.h,
                ),
                Center(
                    child: CustomTextTitle(
                      text: "changeDisplayLang".tr,
                    )),
                SizedBox(
                  height: 100.h,
                ),
                SizedBox(
                    height: 50.h,
                    child: CustomButtonPrimary(
                        text: "اللغة العربية",
                        onpressed: () {
                          controllerLang.changLocal(AppStrings.ar);
                        })),
                SizedBox(
                  height: 40.h,
                ),
                SizedBox(
                    height: 50.h,
                    child: CustomButtonPrimary(
                        text: "English",
                        onpressed: () {
                          controllerLang.changLocal(AppStrings.en);
                        })),
              ],
            ),
          ),
        ),
        connectivityBuilder:
            (BuildContext context, ConnectivityResult connectivity, Widget child) {

          final bool connected = connectivity != ConnectivityResult.none;
          return connected?child:NoConnectionScreen();


        },
      ),
    );
  }
}
