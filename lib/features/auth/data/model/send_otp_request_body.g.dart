// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_otp_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendOtpRequestBody _$SendOtpRequestBodyFromJson(Map<String, dynamic> json) =>
    SendOtpRequestBody(
      mobile: json['mobile'] as String?,
      tenantId: json['tenant_id'] as String?,
      userId: json['user_id'] as String?,
    );

Map<String, dynamic> _$SendOtpRequestBodyToJson(SendOtpRequestBody instance) =>
    <String, dynamic>{
      'mobile': instance.mobile,
      'tenant_id': instance.tenantId,
      'user_id': instance.userId,
    };
