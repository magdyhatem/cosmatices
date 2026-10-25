import 'package:dio/dio.dart';
import 'cash_helper.dart';

enum Datastate {loading,faile,success}

String? token;

class DioHelper {
  static const baseURL = "https://cosmatics.growfet.com";
  static final _dio = Dio(
    BaseOptions(baseUrl: baseURL,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        if(token!=null)
        "Authorization":"Bearer $token"
      },
    ),
  );
  static String _extractErrorMessage(dynamic errorData, String? defaultMsg) {
    if (errorData is Map) {
      if (errorData['message'] != null) {
        return errorData['message'].toString();
      }
      if (errorData['error'] != null) {
        return errorData['error'].toString();
      }
      if (errorData['errors'] is Map) {
        final errorsMap = errorData['errors'] as Map;
        final List<String> allErrors = [];
        for (var value in errorsMap.values) {
          if (value is List) {
            allErrors.addAll(value.map((e) => e.toString()));
          } else if (value != null) {
            allErrors.add(value.toString());
          }
        }
        if (allErrors.isNotEmpty) return allErrors.join(', ');
      }
      if (errorData['title'] != null) {
        return errorData['title'].toString();
      }
    } else if (errorData is String && errorData.isNotEmpty) {
      return errorData;
    }
    return defaultMsg ?? 'An error occurred. Please try again.';
  }

  static Future<CustomResponse> sendData({
    String path = '',
    Map<String, dynamic>? data,
  }) async {
    try {
      final currentToken = token ?? (CacheHelper.token.isNotEmpty ? CacheHelper.token : null);
      final Response resp = await _dio.post(
        path,
        data: data,
        options: Options(headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          if (currentToken != null) "Authorization": "Bearer $currentToken",
        }),
      );
      return CustomResponse(
        isSuccess: true,
        data: resp.data,
        message: resp.data is Map ? resp.data['message']?.toString() : null,
      );
    } on DioException catch (ex) {
      final msg = _extractErrorMessage(ex.response?.data, ex.message);
      print("Dio POST error ($path): ${ex.response?.statusCode} - $msg");
      return CustomResponse(isSuccess: false, message: msg);
    } catch (e) {
      print("Dio POST generic error ($path): $e");
      return CustomResponse(isSuccess: false, message: e.toString());
    }
  }

  static Future<CustomResponse> getData({String path = ''}) async {
    try {
      final currentToken = token ?? (CacheHelper.token.isNotEmpty ? CacheHelper.token : null);
      final resp = await _dio.get(
        path,
        options: Options(headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          if (currentToken != null) "Authorization": "Bearer $currentToken",
        }),
      );
      return CustomResponse(isSuccess: true, data: resp.data);
    } on DioException catch (ex) {
      final msg = _extractErrorMessage(ex.response?.data, ex.message);
      print("Dio GET error ($path): ${ex.response?.statusCode} - $msg");
      return CustomResponse(isSuccess: false, message: msg);
    } catch (e) {
      print("Dio GET generic error ($path): $e");
      return CustomResponse(isSuccess: false, message: e.toString());
    }
  }
}

class CustomResponse {
  final bool isSuccess;
  String? message;
  dynamic data;
  CustomResponse({required this.isSuccess, this.message, this.data});
}
