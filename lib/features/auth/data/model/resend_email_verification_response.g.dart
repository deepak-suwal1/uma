// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resend_email_verification_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResendEmailVerificationResponse _$ResendEmailVerificationResponseFromJson(
        Map<String, dynamic> json) =>
    ResendEmailVerificationResponse(
      data: json['data'] as String?,
      message: (json['message'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ResendEmailVerificationResponseToJson(
        ResendEmailVerificationResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
    };
