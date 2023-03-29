import 'package:dio/dio.dart';

class DioException implements Exception {
  String errorMessage = 'error';

  DioException.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        errorMessage = 'Request to the server was cancelled.';
        break;
      case DioErrorType.connectTimeout:
        errorMessage = 'Connection timed out.';
        break;
      case DioErrorType.receiveTimeout:
        errorMessage = 'Receiving timeout occurred.';
        break;
      case DioErrorType.sendTimeout:
        errorMessage = 'Request send timeout.';
        break;
      case DioErrorType.response:
        errorMessage = _handleStatusCode(dioError.response);
        break;
      case DioErrorType.other:
        if (dioError.message.contains('SocketException')) {
          errorMessage = 'تحقق من اتصال الإنترنت';
          break;
        }
        errorMessage = 'خطأ غير متوقع';
        break;
      default:
        errorMessage = dioError.response!.data['ErrorList'].toString();
        break;
    }
  }

  String _handleStatusCode(Response? response) {
    switch (response?.statusCode) {
      case 400:
        return response!.data.toString();
      case 401:
        return response!.data['errors'].toString();
      case 403:
        return 'لا تمتلك صلاحيات للعرض';
      case 404:
        return response!.data['message'].toString();
      case 405:
        return 'Method not allowed. Please check the Allow header for the allowed HTTP methods.';
      case 415:
        return 'Unsupported media type. The requested content type or version number is invalid.';
      case 422:
        return 'Data validation failed.';
      case 429:
        return 'Too many requests.';
      case 500:
        return 'Internal server error.';
      default:
        return 'Oops something went wrong!';
    }
  }

  @override
  String toString() => errorMessage;
}
