// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionModel _$SessionModelFromJson(Map<String, dynamic> json) => SessionModel(
      isKycSubmitted: json['isKycSubmitted'] as bool? ?? false,
      isMobileVerified: json['isMobileVerified'] as bool? ?? false,
      isEmailVerified: json['isEmailVerified'] as bool? ?? false,
      source: json['source'] as String? ?? '',
      isTocAccepted: json['isTocAccepted'] as bool? ?? false,
    );

Map<String, dynamic> _$SessionModelToJson(SessionModel instance) =>
    <String, dynamic>{
      'isKycSubmitted': instance.isKycSubmitted,
      'isMobileVerified': instance.isMobileVerified,
      'isEmailVerified': instance.isEmailVerified,
      'source': instance.source,
      'isTocAccepted': instance.isTocAccepted,
    };
