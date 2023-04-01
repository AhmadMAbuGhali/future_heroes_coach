import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_coach/data/api/api_client.dart';
import 'package:future_heroes_coach/models/MyStudent_model.dart';
import 'package:future_heroes_coach/models/class_time_model.dart';
import 'package:future_heroes_coach/models/complaint_replay.dart';
import 'package:future_heroes_coach/models/order_replay.dart';
import 'package:future_heroes_coach/models/profile_data.dart';
import 'package:future_heroes_coach/services/shared_preference_helper.dart';

import 'package:image_picker/image_picker.dart';

import '../data/api/exception_handling.dart';
import '../main.dart';
import '../models/respons_massage_code.dart';
import '../resources/color_manager.dart';
import 'auth_provider.dart';

class AppProvider extends ChangeNotifier {
  AppProvider() {
    getProfileData();
    getComplaintReplay();
    getOrderReplay();
    getClassTime();
  }

  int? _id;

  int get id => _id!;

  void setId(int id) {
    _id = id;
    notifyListeners();
  }

  bool isLoading = false;

  changeIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  File? imageFile;
  File? imageFileNull;

  profile_model? profileData;

  TextEditingController oldPass = TextEditingController();
  TextEditingController newPass = TextEditingController();
  TextEditingController confPass = TextEditingController();

  bool showOldPasswordAuth = true;
  bool showNewPasswordAuth = true;
  bool showConfPasswordAuth = true;

  changeShowOldPasswordAuth() {
    showOldPasswordAuth = !showOldPasswordAuth;
    notifyListeners();
  }

  changeShowNewPasswordAuth() {
    showNewPasswordAuth = !showNewPasswordAuth;
    notifyListeners();
  }

  logOut() {
    getIt<SharedPreferenceHelper>().setIsLogin(isLogint: false);
    getIt<SharedPreferenceHelper>().setUserToken(userToken: '');
    clearAllData();
  }

  changeShowConfPasswordAuth() {
    showConfPasswordAuth = !showConfPasswordAuth;
    notifyListeners();
  }

  Future<profile_model?> getProfileData() async {
    try {
      profileData = await DioClient.dioClient.getProfileData();
      getIt<SharedPreferenceHelper>()
          .setEmail(email: profileData!.email.toString());

      getIt<SharedPreferenceHelper>()
          .setDOB(dob: profileData!.dateOfBirth.toString());
      getIt<SharedPreferenceHelper>()
          .setPhone(phone: profileData!.phoneNumber.toString());
      print(profileData!.email.toString());
      notifyListeners();
    } on DioError catch (e) {
      String massage = DioException.fromDioError(e).toString();
      final snackBar = SnackBar(
        content: SizedBox(height: 32.h, child: Center(child: Text(massage))),
        backgroundColor: ColorManager.red,
        behavior: SnackBarBehavior.floating,
        width: 300.w,
        duration: const Duration(seconds: 1),
      );
    }
    notifyListeners();
  }

  Future _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );

    if (pickedFile != null) {
      // File imageFile = File(pickedFile.path);
      final imageTemp = File(pickedFile.path);
      this.imageFile = imageTemp;
      notifyListeners();
    }
  }

  openCamera(BuildContext context) {
    _getFromCamera();
    Navigator.pop(context);
  }

  openGallery(BuildContext context) {
    _getFromGallery();
    Navigator.pop(context);
  }

  Future _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );

    if (pickedFile != null) {
      // File imageFile = File(pickedFile.path);
      final imageTemp = File(pickedFile.path);
      this.imageFile = imageTemp;
      notifyListeners();
    }
  }

  Future<String?> postComplaint(String title, String subject) async {
    try {
      await DioClient.dioClient.postComplaint(title, subject);
      print("Done");
      notifyListeners();
    } on DioError catch (e) {
      print(e.toString());
      String massage = DioException.fromDioError(e).toString();
      final snackBar = SnackBar(
        content: SizedBox(height: 32.h, child: Center(child: Text(massage))),
        backgroundColor: ColorManager.red,
        behavior: SnackBarBehavior.floating,
        width: 300.w,
        duration: const Duration(seconds: 1),
      );
    }
    notifyListeners();
  }

  Future<String?> postOrder(String title, String subject) async {
    try {
      await DioClient.dioClient.postOrder(title, subject);
      print("Done");
      notifyListeners();
    } on DioError catch (e) {
      print(e.toString());
      String massage = DioException.fromDioError(e).toString();
      final snackBar = SnackBar(
        content: SizedBox(height: 32.h, child: Center(child: Text(massage))),
        backgroundColor: ColorManager.red,
        behavior: SnackBarBehavior.floating,
        width: 300.w,
        duration: const Duration(seconds: 1),
      );
    }
    notifyListeners();
  }

  final TextEditingController reasonController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();
  Future<String?> postUserPostponement(
      int id, String reason, String details) async {
    try {
      await DioClient.dioClient.postUserPostponement(id, reason, details);
      print("Done");
      notifyListeners();
    } on DioError catch (e) {
      print(e.toString());
      String massage = DioException.fromDioError(e).toString();
      final snackBar = SnackBar(
        content: SizedBox(height: 32.h, child: Center(child: Text(massage))),
        backgroundColor: ColorManager.red,
        behavior: SnackBarBehavior.floating,
        width: 300.w,
        duration: const Duration(seconds: 1),
      );
    }
    notifyListeners();
  }

  Future<String?> resetPasswordAuthorize(
      String oldPass, String pass, String conPass) async {
    try {
      ResponsMassageCode? success = await DioClient.dioClient
          .resetPasswordAuthorize(oldPass, pass, conPass);

      if (success!.message != null) {
        notifyListeners();
        return 'true';
      }
    } on DioError catch (e) {
      notifyListeners();
      print(e.toString());
      return e.response?.data['message'].toString();
    }
    return null;
  }

  List<ComplaintReplay> complaintReplay = [];
  Future<ComplaintReplay?> getComplaintReplay() async {
    try {
      complaintReplay = await DioClient.dioClient.getComplaintReplay();
    } on DioError catch (e) {
      String massage = DioException.fromDioError(e).toString();
      final snackBar = SnackBar(
        content: SizedBox(height: 32.h, child: Center(child: Text(massage))),
        backgroundColor: ColorManager.red,
        behavior: SnackBarBehavior.floating,
        width: 300.w,
        duration: const Duration(seconds: 1),
      );
    }
    notifyListeners();
  }

  List<OrderReplay> orderReplay = [];
  Future<OrderReplay?> getOrderReplay() async {
    try {
      orderReplay = await DioClient.dioClient.getOrderReplay();
    } on DioError catch (e) {
      String massage = DioException.fromDioError(e).toString();
      final snackBar = SnackBar(
        content: SizedBox(height: 32.h, child: Center(child: Text(massage))),
        backgroundColor: ColorManager.red,
        behavior: SnackBarBehavior.floating,
        width: 300.w,
        duration: const Duration(seconds: 1),
      );
    }
    notifyListeners();
  }

  List<ClassTime> classTime = [];

  Future<ClassTime?> getClassTime() async {
    try {
      classTime = await DioClient.dioClient.getLecture();
    } on DioError catch (e) {
      String massage = DioException.fromDioError(e).toString();
      final snackBar = SnackBar(
        content: SizedBox(height: 32.h, child: Center(child: Text(massage))),
        backgroundColor: ColorManager.red,
        behavior: SnackBarBehavior.floating,
        width: 300.w,
        duration: const Duration(seconds: 1),
      );
    }
    notifyListeners();
  }

// My Student
  List<MyStudentModel> studentModel = [];
  Future<MyStudentModel?> getStudentsClass(int classId) async {
    try {
      studentModel = await DioClient.dioClient.getStudentsClass(classId);
    } on DioError catch (e) {
      String massage = DioException.fromDioError(e).toString();
      final snackBar = SnackBar(
        content: SizedBox(height: 32.h, child: Center(child: Text(massage))),
        backgroundColor: ColorManager.red,
        behavior: SnackBarBehavior.floating,
        width: 300.w,
        duration: const Duration(seconds: 1),
      );
    }
    notifyListeners();
  }

  Future<File?> updateImage(File image) async {
    try {
      await DioClient.dioClient.updateImage(image);
    } on DioError catch (e) {
      String massage = DioException.fromDioError(e).toString();
      final snackBar = SnackBar(
        content: SizedBox(height: 32.h, child: Center(child: Text(massage))),
        backgroundColor: ColorManager.red,
        behavior: SnackBarBehavior.floating,
        width: 300.w,
        duration: const Duration(seconds: 1),
      );
    }
    notifyListeners();
  }

  Future<bool?> getIsActive() async {
    try {
      bool? isActive = await DioClient.dioClient.getIsActive();
      getIt<SharedPreferenceHelper>().setActiveStat(activeStat: isActive!);
    } on DioError catch (e) {
      String massage = DioException.fromDioError(e).toString();
      final snackBar = SnackBar(
        content: SizedBox(height: 32.h, child: Center(child: Text(massage))),
        backgroundColor: ColorManager.red,
        behavior: SnackBarBehavior.floating,
        width: 300.w,
        duration: const Duration(seconds: 1),
      );
    }
    notifyListeners();
  }

  bool firstTime = true;
  changeFirstTime(bool value) {
    firstTime = value;
    notifyListeners();
  }

  clearAllData() {
    getIt<AuthProvider>().listTime = [];

    getIt<AuthProvider>().coachFromId = []; // نشطة

    getIt<AuthProvider>().timeId = [];
    getIt<AuthProvider>().timeListString = [];
    getIt<AuthProvider>().timeListMain = [];

    getIt<AppProvider>().complaintReplay = [];
    getIt<AppProvider>().orderReplay = [];
    getIt<AppProvider>().classTime = [];
  }

  getAllData() {
    getIt<AuthProvider>().listTime;

    getIt<AuthProvider>().coachFromId; // نشطة

    getIt<AuthProvider>().timeId;
    getIt<AuthProvider>().timeListString;
    getIt<AuthProvider>().timeListMain;

    getIt<AppProvider>().complaintReplay;
    getIt<AppProvider>().orderReplay;
    getIt<AppProvider>().classTime;
  }
}
