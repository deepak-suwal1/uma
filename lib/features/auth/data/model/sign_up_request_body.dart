import 'package:json_annotation/json_annotation.dart';

part 'sign_up_request_body.g.dart';

@JsonSerializable()
class SignUpRequestBody {
  final String? firstName;
  final String? lastName;
  final String? dob;
  final String? email;
  final String? password;

  const SignUpRequestBody({
    this.firstName,
    this.lastName,
    this.dob,
    this.email,
    this.password,
  });

  factory SignUpRequestBody.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpRequestBodyToJson(this);
}
