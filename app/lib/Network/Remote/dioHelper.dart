import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static initDio() {
    dio = Dio(BaseOptions(
        baseUrl: "http://192.168.1.5:8080/api/",
        receiveDataWhenStatusError: true));
  }

  static Future<Response> getApiData(
      {required String url, Map<String, dynamic>? query}) async {
    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await dio.post(url, data: data, queryParameters: queryParameters);
  }

  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await dio.delete(url, queryParameters: queryParameters);
  }
}
