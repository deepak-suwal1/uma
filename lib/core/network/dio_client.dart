import 'package:dio/dio.dart';

import 'dio_interceptor.dart';

class DioClient {
  late Dio _dio;

  DioClient() {
    _dio = Dio();
    _dio
      ..interceptors.add(DioInterceptor(dio))
      ..interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
        ),
      );
  }

  Dio get dio => _dio;

  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      Response response =
          await _dio.get(path, queryParameters: queryParameters);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(String url, {dynamic data, query}) async {
    try {
      return await _dio.post(url, data: data, queryParameters: query);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> put(String url, dynamic data) async {
    try {
      return await _dio.put(url, data: data);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> patch(String url, dynamic data) async {
    return await _dio.patch(url, data: data);
  }

  Future<Response> delete(String url, {dynamic data}) async {
    return await _dio.delete(url, data: data);
  }
}
