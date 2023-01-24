import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:future_heroes_coach/resources/assets_manager.dart';
import 'package:future_heroes_coach/resources/color_manager.dart';
import 'package:future_heroes_coach/resources/styles_manager.dart';
import 'package:future_heroes_coach/routes/route_helper.dart';
import 'package:future_heroes_coach/widgets/CustomButtonPrimary.dart';
import 'package:future_heroes_coach/widgets/CustomTextFormAuth.dart';
import 'package:future_heroes_coach/widgets/CustomTextTitle.dart';
import 'package:future_heroes_coach/widgets/LogoAuth.dart';
import 'package:future_heroes_coach/widgets/textSignUp.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool remmberMe = false;
  bool hidePass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGround,
      body: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: ListView(
            children: [
              const LogoAuth(),
              SizedBox(
                height: 10.h,
              ),
              CustomTextTitle(
                text: 'login'.tr,
              ),
              const SizedBox(
                height: 30,
              ),
               Text(
                'email'.tr,
                style: getBoldStyle(color: ColorManager.black),
              ),
              SizedBox(
                height: 5.h,
              ),
              CustomTextFormAuth(
                hidepassword: false,
                textInputType: TextInputType.emailAddress,

                hintText: 'email'.tr,
                //  labelText: 'البريد الالكتروني / رقم الهاتف',
                //  iconData: Icons.email_outlined,
              ),
              const SizedBox(
                height: 10,
              ),
               Text(
                'password'.tr,
                 style: getBoldStyle(color: ColorManager.black),
              ),
              const SizedBox(
                height: 5,
              ),
              CustomTextFormAuth(
                textInputType: TextInputType.visiblePassword,
                hidepassword: hidePass,
                pressSuffixIcon: () {
                  setState(() {
                    hidePass = !hidePass;
                  });
                },
                hintText: 'password'.tr,
                // labelText: 'كلمة المرور',
                iconData: hidePass ? Icons.visibility : Icons.visibility_off,
              ),
              Row(
                children: [
                  Switch(
                    value: remmberMe,
                    onChanged: (bool) {
                      setState(() {
                        remmberMe = bool;
                      });
                    },
                    activeColor: ColorManager.primary,
                  ),
                  Text("rememberMe".tr,style: getBoldStyle(color: ColorManager.black,fontSize: 12),),
                 Spacer(),
                  InkWell(
                    onTap: () {
                      Get.toNamed(RouteHelper.forgetPassword);
                    },
                    child:  Text(
                      'forgotPassword'.tr,
                      textAlign: TextAlign.end,
                      style:
                          TextStyle(color: ColorManager.primary, fontSize: 12),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 80.h,
              ),
              CustomButtonPrimary(
                text: 'login'.tr,
                onpressed: () {
                  Get.toNamed(RouteHelper.successLogin);
                },
              ),


            ],
          )),
    );
  }
}
