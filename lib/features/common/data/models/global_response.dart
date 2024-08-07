import 'package:json_annotation/json_annotation.dart';

part 'global_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class GlobalResponse<T> {
  final bool? success;
  final String? message;
  final T? data;

  const GlobalResponse({
    this.success,
    this.message,
    this.data,
  });

  factory GlobalResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$GlobalResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$GlobalResponseToJson(this, toJsonT);
}

@JsonSerializable(genericArgumentFactories: true)
class GlobalListResponse<T> {
  final bool? success;
  final String? message;
  final List<T>? data;

  const GlobalListResponse({
    this.success,
    this.message,
    this.data,
  });

  factory GlobalListResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$GlobalListResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$GlobalListResponseToJson(this, toJsonT);
}

@JsonSerializable()
class GlobalEmptyResponse {
  final bool? success;
  final String? message;

  const GlobalEmptyResponse({
    this.success,
    this.message,
  });

  factory GlobalEmptyResponse.fromJson(Map<String, dynamic> json) =>
      _$GlobalEmptyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GlobalEmptyResponseToJson(this);
}
