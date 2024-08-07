import 'package:json_annotation/json_annotation.dart';

part 'verify_otp_request_body.g.dart';

@JsonSerializable()
class VerifyOtpRequestBody {
  final String? otp;
  @JsonKey(name: 'tenant_id')
  final int? tenantId;
  @JsonKey(name: 'user_id')
  final int? userId;
  @JsonKey(name: 'mobile')
  final String? mobile;

  const VerifyOtpRequestBody({
    this.otp,
    this.tenantId,
    this.userId,
    this.mobile,
  });

  factory VerifyOtpRequestBody.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyOtpRequestBodyToJson(this);
}
