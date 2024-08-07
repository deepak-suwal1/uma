// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgotPasswordRequestBody _$ForgotPasswordRequestBodyFromJson(
        Map<String, dynamic> json) =>
    ForgotPasswordRequestBody(
      source: json['source'] as String?,
      email: json['email'] as String?,
      mobile: json['mobile'] as String?,
    );

Map<String, dynamic> _$ForgotPasswordRequestBodyToJson(
        ForgotPasswordRequestBody instance) =>
    <String, dynamic>{
      'source': instance.source,
      'email': instance.email,
      'mobile': instance.mobile,
    };
