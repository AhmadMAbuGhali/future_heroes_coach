import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:future_heroes_coach/resources/assets_manager.dart';
import 'package:future_heroes_coach/resources/color_manager.dart';
import 'package:future_heroes_coach/routes/route_helper.dart';
import 'package:future_heroes_coach/widgets/CustomButtonPrimary.dart';
import 'package:future_heroes_coach/widgets/CustomTextFormAuth.dart';
import 'package:future_heroes_coach/widgets/CustomTextTitle.dart';
import 'package:future_heroes_coach/widgets/LogoAuth.dart';
import 'package:future_heroes_coach/widgets/snakbar.dart';
import 'package:future_heroes_coach/widgets/textSignUp.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpState();
}

class _SignUpState extends State<SignUpScreen> {
  bool remmberMe = false;
  bool hidePass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGround,
      body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: ListView(
            children: [
              const LogoAuth(),
              const SizedBox(
                height: 10,
              ),
               CustomTextTitle(
                text: 'انشئ حسابك',
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'البريد الالكتروني / رقم الهاتف',
                style: TextStyle(fontSize: 12),
              ),
              const SizedBox(
                height: 5,
              ),
              CustomTextFormAuth(
                hidepassword: false,
                textInputType: TextInputType.emailAddress,

                hintText: 'البريد الالكتروني / رقم الهاتف',
                //  labelText: 'البريد الالكتروني / رقم الهاتف',
                //  iconData: Icons.email_outlined,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'كلمة المرور',
                style: TextStyle(fontSize: 12),
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
                hintText: 'كلمة المرور',
                // labelText: 'كلمة المرور',
                iconData: hidePass ? Icons.visibility : Icons.visibility_off,
              ),
              CustomButtonPrimary(
                text: 'متابعة',
                onpressed: () {
                  snakbarWidget(context,
                          Titel: 'مرحبا بك',
                          Description: 'قم باكمال عملة التسجيل')
                      .Success();
                  Get.offNamed(RouteHelper.signUpPart2);
                },
              ),
              const SizedBox(
                height: 50,
              ),
              CustomTextSignUpOrSignin(
                textone: ' لديك حساب ؟ ',
                texttwo: 'قم بالدخول الى حسابك',
                onTap: () {
                  Get.offNamed(RouteHelper.getLogin());
                },
              ),
            ],
          )),
    );
  }
}
