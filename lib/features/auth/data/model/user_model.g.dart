// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      kyc: json['kyc'] == null
          ? null
          : Kyc.fromJson(json['kyc'] as Map<String, dynamic>),
      isPlanPurchased: json['isPlanPurchased'] as bool?,
      isPlanActive: json['isPlanActive'] as bool?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'user': instance.user,
      'kyc': instance.kyc,
      'isPlanPurchased': instance.isPlanPurchased,
      'isPlanActive': instance.isPlanActive,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: (json['id'] as num?)?.toInt(),
      tenantId: (json['tenant_id'] as num?)?.toInt(),
      uid: json['uid'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      mobile: json['mobile'] as String?,
      emailVerifiedAt: json['email_verified_at'] as String?,
      mobileVerifiedAt: json['mobile_verified_at'] as String?,
      planId: (json['plan_id'] as num?)?.toInt(),
      status: json['status'] as String?,
      isTocAccepted: json['is_toc_accepted'] as bool?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      lastLogin: json['last_login'] as String?,
      viberAccount: json['viber_account'] == null
          ? null
          : ViberAccount.fromJson(
              json['viber_account'] as Map<String, dynamic>),
      smsCodes: json['sms_codes'] as List<dynamic>?,
      userDetails: json['user_details'] == null
          ? null
          : UserDetails.fromJson(json['user_details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'tenant_id': instance.tenantId,
      'uid': instance.uid,
      'name': instance.name,
      'email': instance.email,
      'mobile': instance.mobile,
      'email_verified_at': instance.emailVerifiedAt,
      'mobile_verified_at': instance.mobileVerifiedAt,
      'plan_id': instance.planId,
      'status': instance.status,
      'is_toc_accepted': instance.isTocAccepted,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'last_login': instance.lastLogin,
      'viber_account': instance.viberAccount,
      'sms_codes': instance.smsCodes,
      'user_details': instance.userDetails,
    };

ViberAccount _$ViberAccountFromJson(Map<String, dynamic> json) => ViberAccount(
      tenantId: (json['tenant_id'] as num?)?.toInt(),
      senderName: json['sender_name'] as String?,
      senderNumber: json['sender_number'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$ViberAccountToJson(ViberAccount instance) =>
    <String, dynamic>{
      'tenant_id': instance.tenantId,
      'sender_name': instance.senderName,
      'sender_number': instance.senderNumber,
      'status': instance.status,
    };

UserDetails _$UserDetailsFromJson(Map<String, dynamic> json) => UserDetails(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      addressId: (json['address_id'] as num?)?.toInt(),
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$UserDetailsToJson(UserDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'address_id': instance.addressId,
      'updated_at': instance.updatedAt,
    };

Kyc _$KycFromJson(Map<String, dynamic> json) => Kyc(
      original: json['original'] == null
          ? null
          : Original.fromJson(json['original'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KycToJson(Kyc instance) => <String, dynamic>{
      'original': instance.original,
    };

Original _$OriginalFromJson(Map<String, dynamic> json) => Original(
      data: json['data'] == null
          ? null
          : KycData.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$OriginalToJson(Original instance) => <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
    };

KycData _$KycDataFromJson(Map<String, dynamic> json) => KycData(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      addressId: (json['address_id'] as num?)?.toInt(),
      name: json['name'] as String?,
      city: json['city'] as String?,
      stateId: json['state_id'] as String?,
      type: json['type'] as String?,
      panNo: json['pan_no'] as String?,
      phone: json['phone'] as String?,
      website: json['website'] as String?,
      industryType: json['industry_type'] as String?,
      isKycVerified: json['is_kyc_verified'] as bool?,
      phone1: json['phone1'] as String?,
      tenantId: (json['tenant_id'] as num?)?.toInt(),
      districtId: (json['district_id'] as num?)?.toInt(),
      address: json['address'] as String?,
      district: json['district'] as String?,
    );

Map<String, dynamic> _$KycDataToJson(KycData instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'address_id': instance.addressId,
      'name': instance.name,
      'city': instance.city,
      'state_id': instance.stateId,
      'type': instance.type,
      'pan_no': instance.panNo,
      'phone': instance.phone,
      'website': instance.website,
      'industry_type': instance.industryType,
      'is_kyc_verified': instance.isKycVerified,
      'phone1': instance.phone1,
      'tenant_id': instance.tenantId,
      'district_id': instance.districtId,
      'address': instance.address,
      'district': instance.district,
    };
