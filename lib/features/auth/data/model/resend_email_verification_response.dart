import 'package:json_annotation/json_annotation.dart';

part 'resend_email_verification_response.g.dart';

@JsonSerializable()
class ResendEmailVerificationResponse {
  final String? data;
  final int? message;

  const ResendEmailVerificationResponse({
    this.data,
    this.message,
  });

  factory ResendEmailVerificationResponse.fromJson(Map<String, dynamic> json) =>
      _$ResendEmailVerificationResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ResendEmailVerificationResponseToJson(this);
}
