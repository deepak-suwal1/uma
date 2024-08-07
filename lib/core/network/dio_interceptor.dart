import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:uhuru/core/constants/constants.dart';
import 'package:uhuru/core/injection/injection.dart';
import 'package:uhuru/core/network/api_endpoints.dart';
import 'package:uhuru/core/session/session_manager.dart';

class DioInterceptor extends InterceptorsWrapper {
  final Dio dio;

  DioInterceptor(this.dio);

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await getIt<SessionManager>().getToken();
    options.baseUrl = baseUrl;
    options.connectTimeout = const Duration(seconds: 20);
    options.receiveTimeout = const Duration(seconds: 20);
    options.headers = {'Authorization': 'Bearer $token'};
    options.responseType = ResponseType.json;
    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      try {
        final refreshed = await _refreshToken();
        if (refreshed) {
          final requestOptions = err.requestOptions;
          final response = await dio.request(
            requestOptions.path,
            data: requestOptions.data,
            queryParameters: requestOptions.queryParameters,
            options: Options(
              method: requestOptions.method,
              headers: requestOptions.headers,
            ),
          );
          return handler.resolve(response);
        }
      } catch (e) {
        // Handle token refresh error
      }
    }
    return handler.next(err);
  }

  Future<bool> _refreshToken() async {
    final sessionManager = getIt<SessionManager>();
    try {
      final accessToken = await sessionManager.getToken();
      final refreshToken = await sessionManager.getRefreshToken();
      final response = await dio.post(
        refreshTokenPath,
        data: {
          "accessToken": accessToken,
          "refreshToken": refreshToken,
        },
      );

      if (response.statusCode == 200) {
        final newAccessToken = response.data["message"];
        sessionManager.saveToken(newAccessToken);
        return true;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return false;
  }
}
