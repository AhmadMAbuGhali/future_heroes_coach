import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static const String token = "token";
  static const String isActive = "isActive";
  static const String isWaiting = "isWaiting";
  static const String isLogin = 'isLogin';
  static const String status = 'status';
  static const String userEmail = 'userEmail';
  static const String userDOB = 'userDOB';
  static const String userPhoneNumber = 'userPhoneNumber';
  final SharedPreferences prefs;

  SharedPreferenceHelper({required this.prefs});

  Future<void> setUserToken({required String userToken}) async {
    await prefs.setString(token, userToken);
  }

  Future<void> setStatus({required String statusString}) async {
    await prefs.setString(status, statusString);
  }

  Future<void> setEmail({required String email}) async {
    await prefs.setString(userEmail, email);
  }

  Future<void> setPhone({required String phone}) async {
    await prefs.setString(userPhoneNumber, phone);
  }

  Future<void> setDOB({required String dob}) async {
    await prefs.setString(userDOB, dob);
  }

  Future<void> setActiveStat({required bool activeStat}) async {
    await prefs.setBool(isActive, activeStat);
  }

  Future<void> setWaitingStat({required bool waitingStat}) async {
    await prefs.setBool(isWaiting, waitingStat);
  }

  String? getUserToken() {
    final userToken = prefs.getString(token);
    return userToken;
  }

  String? getStatus() {
    final statusString = prefs.getString(status);
    return statusString;
  }

  String? getUserEmail() {
    final userEmailData = prefs.getString(userEmail);
    return userEmailData;
  }

  String? getUserPhone() {
    final userPhoneData = prefs.getString(userPhoneNumber);
    return userPhoneData;
  }

  String? getUserDOB() {
    final userDOBData = prefs.getString(userDOB);
    return userDOBData;
  }

  bool? getActiveStat() {
    final isActiveStat = prefs.getBool(isActive);
    return isActiveStat;
  }

  bool? getWaitingStat() {
    final isWaitingStat = prefs.getBool(isWaiting);
    return isWaitingStat;
  }

  Future<void> setIsLogin({required bool isLogint}) async {
    await prefs.setBool(isLogin, isLogint);
  }

  bool? getIsLogin() {
    final userLogin = prefs.getBool(isLogin);
    return userLogin;
  }
}
