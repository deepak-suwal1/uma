import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final User? user;
  final Kyc? kyc;
  final bool? isPlanPurchased;
  final bool? isPlanActive;

  const UserModel({
    this.user,
    this.kyc,
    this.isPlanPurchased,
    this.isPlanActive,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable()
class User {
  final int? id;
  @JsonKey(name: 'tenant_id')
  final int? tenantId;
  final String? uid;
  final String? name;
  final String? email;
  final String? mobile;
  @JsonKey(name: 'email_verified_at')
  final String? emailVerifiedAt;
  @JsonKey(name: 'mobile_verified_at')
  final String? mobileVerifiedAt;
  @JsonKey(name: 'plan_id')
  final int? planId;
  final String? status;
  @JsonKey(name: 'is_toc_accepted')
  final bool? isTocAccepted;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'last_login')
  final String? lastLogin;
  @JsonKey(name: 'viber_account')
  final ViberAccount? viberAccount;
  @JsonKey(name: 'sms_codes')
  final List<dynamic>? smsCodes;
  @JsonKey(name: 'user_details')
  final UserDetails? userDetails;

  const User({
    this.id,
    this.tenantId,
    this.uid,
    this.name,
    this.email,
    this.mobile,
    this.emailVerifiedAt,
    this.mobileVerifiedAt,
    this.planId,
    this.status,
    this.isTocAccepted,
    this.createdAt,
    this.updatedAt,
    this.lastLogin,
    this.viberAccount,
    this.smsCodes,
    this.userDetails,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class ViberAccount {
  @JsonKey(name: 'tenant_id')
  final int? tenantId;
  @JsonKey(name: 'sender_name')
  final String? senderName;
  @JsonKey(name: 'sender_number')
  final String? senderNumber;
  final String? status;

  const ViberAccount({
    this.tenantId,
    this.senderName,
    this.senderNumber,
    this.status,
  });

  factory ViberAccount.fromJson(Map<String, dynamic> json) =>
      _$ViberAccountFromJson(json);

  Map<String, dynamic> toJson() => _$ViberAccountToJson(this);
}

@JsonSerializable()
class UserDetails {
  final int? id;
  @JsonKey(name: 'user_id')
  final int? userId;
  @JsonKey(name: 'first_name')
  final String? firstName;
  @JsonKey(name: 'last_name')
  final String? lastName;
  @JsonKey(name: 'address_id')
  final int? addressId;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  const UserDetails({
    this.id,
    this.userId,
    this.firstName,
    this.lastName,
    this.addressId,
    this.updatedAt,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) =>
      _$UserDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$UserDetailsToJson(this);
}

@JsonSerializable()
class Kyc {
  final Original? original;

  const Kyc({
    this.original,
  });

  factory Kyc.fromJson(Map<String, dynamic> json) => _$KycFromJson(json);

  Map<String, dynamic> toJson() => _$KycToJson(this);
}

@JsonSerializable()
class Original {
  final KycData? data;
  final String? message;

  const Original({
    this.data,
    this.message,
  });

  factory Original.fromJson(Map<String, dynamic> json) =>
      _$OriginalFromJson(json);

  Map<String, dynamic> toJson() => _$OriginalToJson(this);
}

@JsonSerializable()
class KycData {
  final int? id;
  @JsonKey(name: 'user_id')
  final int? userId;
  @JsonKey(name: 'address_id')
  final int? addressId;
  final String? name;
  final String? city;
  @JsonKey(name: 'state_id')
  final String? stateId;
  final String? type;
  @JsonKey(name: 'pan_no')
  final String? panNo;
  final String? phone;
  final String? website;
  @JsonKey(name: 'industry_type')
  final String? industryType;
  @JsonKey(name: 'is_kyc_verified')
  final bool? isKycVerified;
  final String? phone1;
  @JsonKey(name: 'tenant_id')
  final int? tenantId;
  @JsonKey(name: 'district_id')
  final int? districtId;
  final String? address;
  final String? district;

  const KycData({
    this.id,
    this.userId,
    this.addressId,
    this.name,
    this.city,
    this.stateId,
    this.type,
    this.panNo,
    this.phone,
    this.website,
    this.industryType,
    this.isKycVerified,
    this.phone1,
    this.tenantId,
    this.districtId,
    this.address,
    this.district,
  });

  factory KycData.fromJson(Map<String, dynamic> json) =>
      _$KycDataFromJson(json);

  Map<String, dynamic> toJson() => _$KycDataToJson(this);
}
