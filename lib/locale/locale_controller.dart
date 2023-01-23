import 'dart:ui';

import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';


class MyLocalController extends GetxController{


  Locale? intalLang ;

  void changLocal(String codeLang) async{
    Locale locale = new Locale(codeLang);
    shaedpref.setString("curruntLang", codeLang);

        Get.updateLocale(locale);
  }

}