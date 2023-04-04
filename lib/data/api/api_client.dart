import 'dart:ffi';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:future_heroes_coach/data/api/apiconst.dart';
import 'package:future_heroes_coach/main.dart';
import 'package:future_heroes_coach/models/MyStudent_model.dart';
import 'package:future_heroes_coach/models/StandardRateModel.dart';
import 'package:future_heroes_coach/models/complaint_replay.dart';
import 'package:future_heroes_coach/models/login_model.dart';
import 'package:future_heroes_coach/models/order_replay.dart';
import 'package:future_heroes_coach/models/profile_data.dart';
import 'package:future_heroes_coach/models/time_list.dart';

import '../../models/class_time_model.dart';
import '../../models/notification_model.dart';
import '../../models/respons_massage_code.dart';
import '../../services/shared_preference_helper.dart';

class DioClient {
  DioClient._() {
    initDio();
  }

  // initDio
  static final DioClient dioClient = DioClient._();
  Dio? dio;

  initDio() {
    dio = Dio();
    dio?.options.baseUrl = ApiConstant.baseUrl;
  }

// Login
  Future<LoginModel?> login(String email, String password) async {
    try {
      Response response = await dio!.post(ApiConstant.login,
          data: {"email": email, "password": password});
      LoginModel user = LoginModel.fromJson(response.data);
      if (user.role == "Coach") {
        return user;
      } else {
        return null;
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<List<TimeList>> getTimeList(String emailUser) async {
    Response response = await dio!.get(ApiConstant.timeList,
        options: Options(
          headers: {"Accept-Language": shaedpref.getString("curruntLang")},
        ),
        queryParameters: {"userEmail": emailUser});
    List<TimeList> listcat = [];
    listcat = (response.data as List).map((e) => TimeList.fromJson(e)).toList();
    print('listcat.length');
    print(listcat.length);
    return listcat;
  }

  Future<void> sendClassId(List<int> id) async {
    await dio!.post(ApiConstant.traineeClass,
        data: {"classId": id},
        options: Options(
          headers: {
            "Accept-Language": shaedpref.getString("curruntLang"),
            'Authorization':
                'Bearer ${getIt<SharedPreferenceHelper>().getUserToken()}'
          },
        ));
  }

  Future<void> sendDiseases(List<int> id) async {
    await dio!.post(ApiConstant.userDiseases,
        data: {"diseaseId": id},
        options: Options(
          headers: {
            "Accept-Language": shaedpref.getString("curruntLang"),
            'Authorization':
                'Bearer ${getIt<SharedPreferenceHelper>().getUserToken()}'
          },
        ));
  }

  Future<void> sendOfferId(int id) async {
    await dio!.post(ApiConstant.userOrder,
        data: {"offerId": id},
        options: Options(
          headers: {
            "Accept-Language": shaedpref.getString("curruntLang"),
            'Authorization':
                'Bearer ${getIt<SharedPreferenceHelper>().getUserToken()}'
          },
        ));
  }


  Future<List<NotificationModel>> getUserNotification() async {
    Response response = await dio!.get(
      ApiConstant.userNotification,
      options: Options(
        headers: {
          "Accept-Language": shaedpref.getString("curruntLang"),
          'Authorization':
          'Bearer ${getIt<SharedPreferenceHelper>().getUserToken()}'
        },
      ),
    );
    List<NotificationModel>  notificationModel= [];
    notificationModel =
        (response.data as List).map((e) => NotificationModel.fromJson(e)).toList();
    print('listcat.length');
    print(notificationModel.length);
    return notificationModel;
  }


  Future<void> StudentEvaluation(String email, bool isPresence,List<Map<String,int>> evalutions,String note) async {
    await dio!.post(ApiConstant.studentEvaluation,
        data: {

      "email": email,
      "isPresence": isPresence,
      "evalutions": evalutions,
      "note": note,

        },
        options: Options(
          headers: {
            "Accept-Language": shaedpref.getString("curruntLang"),
            'Authorization':
                'Bearer ${getIt<SharedPreferenceHelper>().getUserToken()}'
          },
        ));
  }

  //profileData

  Future<profile_model> getProfileData() async {
    Response response = await dio!.get(ApiConstant.getProfileData,
        options: Options(
          headers: {
            "Accept-Language": shaedpref.getString("curruntLang"),
            'Authorization':
                'Bearer ${getIt<SharedPreferenceHelper>().getUserToken()}'
          },
        ));

    profile_model profileData = profile_model.fromJson(response.data);
    return profileData;
  }

  Future<ResponsMassageCode?> postComplaint(
      String title, String subject) async {
    try {
      await dio!.post(ApiConstant.complaint,
          data: {
            "title": title,
            "subject": subject,
          },
          options: Options(headers: {
            "Accept-Language": shaedpref.getString("curruntLang"),
            'Authorization':
                'Bearer ${getIt<SharedPreferenceHelper>().getUserToken()}'
          }));
      print("Post complaint success");
    } on DioError catch (e) {
      if (e.response?.statusCode == 500) {
        print("Server error occurred: ${e.message}");
      }
      print(e.toString());
    }
  }

  Future<ResponsMassageCode?> postOrder(String title, String subject) async {
    try {
      await dio!.post(ApiConstant.userOrder,
          data: {"title": title, "subject": subject, "offerId": null},
          options: Options(headers: {
            "Accept-Language": shaedpref.getString("curruntLang"),
            'Authorization':
                'Bearer ${getIt<SharedPreferenceHelper>().getUserToken()}'
          }));
      print("Post Order success");
    } on DioError catch (e) {
      if (e.response?.statusCode == 500) {
        print("Server error occurred: ${e.message}");
      }
      print(e.toString());
    }
  }

  Future<ResponsMassageCode?> postUserPostponement(
      int id, String reason, String details) async {
    try {
      await dio!.post(ApiConstant.userPostponement,
          data: {"userPresenceId": id, "reason": reason, "details": details},
          options: Options(headers: {
            "Accept-Language": shaedpref.getString("curruntLang"),
            'Authorization':
                'Bearer ${getIt<SharedPreferenceHelper>().getUserToken()}'
          }));
      print("Post Order success");
    } on DioError catch (e) {
      if (e.response?.statusCode == 500) {
        print("Server error occurred: ${e.message}");
      }
      print(e.toString());
    }
  }

  Future<List<ComplaintReplay>> getComplaintReplay() async {
    Response response = await dio!.get(
      ApiConstant.getUserComplaint,
      options: Options(
        headers: {
          "Accept-Language": shaedpref.getString("curruntLang"),
          'Authorization':
              'Bearer ${getIt<SharedPreferenceHelper>().getUserToken()}'
        },
      ),
    );
    List<ComplaintReplay> complaintReplay = [];
    complaintReplay = (response.data as List)
        .map((e) => ComplaintReplay.fromJson(e))
        .toList();
    print('listcat.length');
    print(complaintReplay.length);
    return complaintReplay;
  }

  Future<List<OrderReplay>> getOrderReplay() async {
    Response response = await dio!.get(
      ApiConstant.getUserOrders,
      options: Options(
        headers: {
          "Accept-Language": shaedpref.getString("curruntLang"),
          'Authorization':
              'Bearer ${getIt<SharedPreferenceHelper>().getUserToken()}'
        },
      ),
    );
    List<OrderReplay> orderReplay = [];
    orderReplay =
        (response.data as List).map((e) => OrderReplay.fromJson(e)).toList();
    print('listcat.length');
    print(orderReplay.length);
    return orderReplay;
  }

  Future<bool?> getIsActive() async {
    await dio!.get(
      ApiConstant.isActiveStatus,
      options: Options(
        headers: {
          "Accept-Language": shaedpref.getString("curruntLang"),
          'Authorization':
              'Bearer ${getIt<SharedPreferenceHelper>().getUserToken()}'
        },
      ),
    );
  }

  Future<List<ClassTime>> getLecture() async {
    Response response = await dio!.get(
      ApiConstant.CoachSchedule,
      options: Options(
        headers: {
          "Accept-Language": shaedpref.getString("curruntLang"),
          'Authorization':
              'Bearer ${getIt<SharedPreferenceHelper>().getUserToken()}'
        },
      ),
    );
    List<ClassTime> classTime = [];
    classTime =
        (response.data as List).map((e) => ClassTime.fromJson(e)).toList();

    print(classTime.length);
    return classTime;
  }

//ForgetPassword
  Future<ResponsMassageCode?> resetSendCode(String email) async {
    Response response = await dio!
        .post(ApiConstant.forgetPassword, queryParameters: {"email": email});
    ResponsMassageCode responseMassage =
        ResponsMassageCode.fromJson(response.data);
    return responseMassage;
  }

  Future<List<MyStudentModel>> getStudentsClass(int classId) async {
    Response response = await dio!
        .get(ApiConstant.studentsClass, queryParameters: {"classId": classId});
    List<MyStudentModel> myStudentModel = [];

    myStudentModel =
        (response.data as List).map((e) => MyStudentModel.fromJson(e)).toList();
    return myStudentModel;
  }

  Future<List<StandardRateModel>> getStandardRate() async {
    Response response = await dio!.get(ApiConstant.getstandardRate,
        options: Options(
          headers: {
            "Accept-Language": shaedpref.getString("curruntLang"),
            'Authorization':
                'Bearer ${getIt<SharedPreferenceHelper>().getUserToken()}'
          },
        ));
    List<StandardRateModel> standardRate = [];
    standardRate = (response.data as List)
        .map((e) => StandardRateModel.fromJson(e))
        .toList();
    return standardRate;
  }

  Future<ResponsMassageCode?> verifyResetSendCode(
      String email, String code) async {
    Response response = await dio!
        .post(ApiConstant.confirmCode, data: {"email": email, "code": code});
    ResponsMassageCode responseMassage =
        ResponsMassageCode.fromJson(response.data);
    return responseMassage;
  }

  Future<ResponsMassageCode?> sendEmailConfirmation(
      String email, String code) async {
    Response response = await dio!.put(ApiConstant.sendEmailConfirmation,
        data: {"email": email, "code": code});
    ResponsMassageCode responseMassage =
        ResponsMassageCode.fromJson(response.data);
    return responseMassage;
  }

  Future<File?> updateImage(File image) async {
    try {
      FormData formData = FormData.fromMap({
        "ImageFile":
            await MultipartFile.fromFile(image.path, filename: image.path),
      });
      await dio!.put(ApiConstant.updateImageProfile,
          data: formData,
          options: Options(
            headers: {
              "Accept-Language": shaedpref.getString("curruntLang"),
              'Authorization':
                  'Bearer ${getIt<SharedPreferenceHelper>().getUserToken()}'
            },
          ));
    } catch (e) {
      print(e.toString());
    }
  }

  Future<ResponsMassageCode?> resetPassword(
      String email, String password, String confirmPassword) async {
    Response response = await dio!.put(ApiConstant.resetPassword, data: {
      "email": email,
      "password": password,
      "confirmPassword": confirmPassword
    });
    ResponsMassageCode responseMassage =
        ResponsMassageCode.fromJson(response.data);
    return responseMassage;
  }

  Future<ResponsMassageCode?> resetPasswordAuthorize(
      String oldPass, String password, String confirmPassword) async {
    try {
      print("1");
      Response response = await dio!.put(
        ApiConstant.resetPasswordAuthorize,
        data: {
          "oldPassword": oldPass,
          "newPassword": password,
          "confirmPassword": confirmPassword
        },
        options: Options(headers: {
          'Authorization':
              'Bearer ${getIt<SharedPreferenceHelper>().getUserToken()}'
        }),
      );

      print("2");
      ResponsMassageCode responseMassage =
          ResponsMassageCode.fromJson(response.data);
      return responseMassage;
    } catch (e) {
      print("3");
    }
  }
}
