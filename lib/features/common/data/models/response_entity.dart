import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import 'error_response.dart';

class ResponseEntity<T> {
  final Either<String, T> result;

  ResponseEntity(this.result);

  factory ResponseEntity.fromResponse(
      Response<dynamic> response, T Function(dynamic) converter) {
    return response.statusCode == 200 || response.statusCode == 201
        ? _handleSuccess(response, converter)
        : _handleErrorResponse(response);
  }

  factory ResponseEntity.fromError(DioException e) {
    return e.response != null
        ? _handleErrorResponse(e.response!)
        : _handleError(e.message ?? '');
  }

  factory ResponseEntity.fromArrayResponse(T data) {
    return ResponseEntity(right(data));
  }

  factory ResponseEntity.fromCustomError(String error) {
    return ResponseEntity(left(error));
  }

  factory ResponseEntity.success(T message) {
    return ResponseEntity(right(message));
  }

  factory ResponseEntity.fromDynamic(dynamic result) {
    return ResponseEntity(right(result));
  }

  static ResponseEntity<T> _handleSuccess<T>(
      Response<dynamic> response, T Function(dynamic) converter) {
    return ResponseEntity(right(converter(response.data)));
  }

  static ResponseEntity<T> _handleErrorResponse<T>(Response response) {
    try {
      if (response.data is Map) {
        final error = ErrorResponse.fromJson(response.data);
        final errorMessage = error.errors?.values.first.first ??
            error.message ??
            'Please try again later';
        return ResponseEntity(left(errorMessage));
      } else {
        return ResponseEntity(
            left('Error occurred: ${response.statusMessage}'));
      }
    } catch (e) {
      return ResponseEntity(left(e.toString()));
    }
  }

  static ResponseEntity<T> _handleError<T>(String errorMessage) {
    return ResponseEntity(left(errorMessage));
  }
}
