import 'package:json_annotation/json_annotation.dart';

part 'send_otp_request_body.g.dart';

@JsonSerializable()
class SendOtpRequestBody {
  final String? mobile;
  @JsonKey(name: 'tenant_id')
  final String? tenantId;
  @JsonKey(name: 'user_id')
  final String? userId;

  const SendOtpRequestBody({
    this.mobile,
    this.tenantId,
    this.userId,
  });

  factory SendOtpRequestBody.fromJson(Map<String, dynamic> json) =>
      _$SendOtpRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$SendOtpRequestBodyToJson(this);
}
