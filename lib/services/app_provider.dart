import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_coach/data/api/api_client.dart';
import 'package:future_heroes_coach/models/MyStudent_model.dart';
import 'package:future_heroes_coach/models/StandardRateModel.dart';
import 'package:future_heroes_coach/models/class_time_model.dart';
import 'package:future_heroes_coach/models/complaint_replay.dart';
import 'package:future_heroes_coach/models/order_replay.dart';
import 'package:future_heroes_coach/models/profile_data.dart';
import 'package:future_heroes_coach/pages/auth/login.dart';
import 'package:future_heroes_coach/pages/home/home_screen.dart';
import 'package:future_heroes_coach/routes/route_helper.dart';
import 'package:future_heroes_coach/services/shared_preference_helper.dart';

import 'package:image_picker/image_picker.dart';

import '../data/api/exception_handling.dart';
import '../main.dart';
import '../models/notification_model.dart';
import '../models/respons_massage_code.dart';
import '../resources/color_manager.dart';
import 'auth_provider.dart';

class AppProvider extends ChangeNotifier {
  AppProvider() {
    getProfileData();
    getComplaintReplay();
    getOrderReplay();
    getClassTime();
    getStandardRate();
  }

  int? _id;

  int get id => _id!;

  void setId(int id) {
    _id = id;
    notifyListeners();
  }

  int? _studentID;

  int get studentID => _studentID!;

  void setStudentID(int studentID) {
    _studentID = studentID;
    notifyListeners();
  }

  bool? _presence;

  bool get presenceValue => _presence!;

  void setpresenceValue(bool presenceValue) {
    _presence = presenceValue;
    notifyListeners();
  }

  bool presence = false;

  changePresence() {
    presence = true;
    absence = false;
    notifyListeners();
  }

  bool absence = false;

  changeAbsence() {
    presence = false;
    absence = true;
    notifyListeners();
  }

  int _currentIntValue1 = 3;
  int _currentIntValue2 = 3;
  int _currentIntValue3 = 3;
  int _currentIntValue4 = 3;
  int _currentIntValue5 = 3;

  int get currentIntValue1 => _currentIntValue1!;

  void setcurrentIntValue1(int currentIntValue1) {
    _currentIntValue1 = currentIntValue1;
    notifyListeners();
  }

  int get currentIntValue2 => _currentIntValue2!;

  void setcurrentIntValue2(int currentIntValue2) {
    _currentIntValue2 = currentIntValue2;
    notifyListeners();
  }

  int get currentIntValue3 => _currentIntValue3!;

  void setcurrentIntValue3(int currentIntValue3) {
    _currentIntValue3 = currentIntValue3;
    notifyListeners();
  }

  int get currentIntValue4 => _currentIntValue4!;

  void setcurrentIntValue4(int currentIntValue4) {
    _currentIntValue4 = currentIntValue4;
    notifyListeners();
  }

  int get currentIntValue5 => _currentIntValue5!;

  void setcurrentIntValue5(int currentIntValue5) {
    _currentIntValue5 = currentIntValue5;
    notifyListeners();
  }

  List<Map<String, int>> rats = [];

  List<NotificationModel> notificationModel = [];
  Future<ComplaintReplay?> getUserNotification() async {
    try {
      notificationModel = await DioClient.dioClient.getUserNotification();
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

  TextEditingController moreDetailsRate = TextEditingController();

  bool isLoading = false;

  changeIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  File? imageFile;
  File? imageFileNull;

  profile_model? profileData;
  StandardRateModel? standardRateModel;
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
    getIt<SharedPreferenceHelper>().setRememberMe(rememberMe: false);

    getIt<SharedPreferenceHelper>().setUserToken(userToken: '');
    clearAllData();
  }

  changeShowConfPasswordAuth() {
    showConfPasswordAuth = !showConfPasswordAuth;
    notifyListeners();
  }

  List<profile_model?> ProfileData = [];
  Future<profile_model?> getProfileData() async {
    try {
      profileData = await DioClient.dioClient.getProfileData();
      getIt<SharedPreferenceHelper>()
          .setEmail(email: profileData!.email.toString());

      getIt<SharedPreferenceHelper>()
          .setDOB(dob: profileData!.dateOfBirth.toString());
      getIt<SharedPreferenceHelper>()
          .setPhone(phone: profileData!.phoneNumber.toString());
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
      updateImage(imageTemp);
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
      updateImage(imageTemp);

      notifyListeners();
    }
  }

  Future<String?> postComplaint(String title, String subject) async {
    try {
      await DioClient.dioClient.postComplaint(title, subject);

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

  Future StudentEvaluation(String email, bool isPresence,
      List<Map<String, int>> evalutions, String note) async {
    try {
      await DioClient.dioClient
          .StudentEvaluation(email, isPresence, evalutions, note);

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

  Future<String?> postOrder(String title, String subject) async {
    try {
      await DioClient.dioClient.postOrder(title, subject);

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

  final TextEditingController reasonController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();
  Future<String?> postUserPostponement(
      int id, String reason, String details) async {
    try {
      await DioClient.dioClient.postUserPostponement(id, reason, details);

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

  List<StandardRateModel> standardRate = [];

  Future<StandardRateModel?> getStandardRate() async {
    try {
      standardRate = await DioClient.dioClient.getStandardRate();
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

  Future<String?> updateImage(File image) async {
    try {
      await DioClient.dioClient.updateImage(image);

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
    getIt<SharedPreferenceHelper>().setEmail(email: '');

    getIt<SharedPreferenceHelper>().setDOB(dob: '');
    getIt<SharedPreferenceHelper>().setPhone(phone: '');
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
