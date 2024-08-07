// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_otp_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyOtpRequestBody _$VerifyOtpRequestBodyFromJson(
        Map<String, dynamic> json) =>
    VerifyOtpRequestBody(
      otp: json['otp'] as String?,
      tenantId: (json['tenant_id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      mobile: json['mobile'] as String?,
    );

Map<String, dynamic> _$VerifyOtpRequestBodyToJson(
        VerifyOtpRequestBody instance) =>
    <String, dynamic>{
      'otp': instance.otp,
      'tenant_id': instance.tenantId,
      'user_id': instance.userId,
      'mobile': instance.mobile,
    };
