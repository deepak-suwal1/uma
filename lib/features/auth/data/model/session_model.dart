import 'package:json_annotation/json_annotation.dart';

part 'session_model.g.dart';

@JsonSerializable()
class SessionModel {
  final bool isKycSubmitted;
  final bool isMobileVerified;
  final bool isEmailVerified;
  final String source;
  final bool isTocAccepted;

  const SessionModel({
    this.isKycSubmitted = false,
    this.isMobileVerified = false,
    this.isEmailVerified = false,
    this.source = '',
    this.isTocAccepted = false,
  });

  factory SessionModel.fromJson(Map<String, dynamic> json) =>
      _$SessionModelFromJson(json);

  Map<String, dynamic> toJson() => _$SessionModelToJson(this);

  SessionModel copyWith({
    bool? isKycSubmitted,
    bool? isMobileVerified,
    bool? isEmailVerified,
    String? source,
    bool? isTocAccepted,
  }) {
    return SessionModel(
      isKycSubmitted: isKycSubmitted ?? this.isKycSubmitted,
      isMobileVerified: isMobileVerified ?? this.isMobileVerified,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
      source: source ?? this.source,
      isTocAccepted: isTocAccepted ?? this.isTocAccepted,
    );
  }
}
