import 'package:json_annotation/json_annotation.dart';

part 'sign_up_response_model.g.dart';

@JsonSerializable()
class SignUpResponseModel {
  final Data? data;
  final String? message;

  const SignUpResponseModel({
    this.data,
    this.message,
  });

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpResponseModelToJson(this);
}

@JsonSerializable()
class Data {
  final String? email;
  final String? mobile;
  final String? uid;
  @JsonKey(name: 'tenant_id')
  final int? tenantId;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  final int? id;
  final List<Roles>? roles;

  const Data({
    this.email,
    this.mobile,
    this.uid,
    this.tenantId,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.roles,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Roles {
  final int? id;
  final String? name;
  @JsonKey(name: 'guard_name')
  final String? guardName;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  final Pivot? pivot;

  const Roles({
    this.id,
    this.name,
    this.guardName,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  factory Roles.fromJson(Map<String, dynamic> json) => _$RolesFromJson(json);

  Map<String, dynamic> toJson() => _$RolesToJson(this);
}

@JsonSerializable()
class Pivot {
  @JsonKey(name: 'model_type')
  final String? modelType;
  @JsonKey(name: 'model_id')
  final int? modelId;
  @JsonKey(name: 'role_id')
  final int? roleId;

  const Pivot({
    this.modelType,
    this.modelId,
    this.roleId,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) => _$PivotFromJson(json);

  Map<String, dynamic> toJson() => _$PivotToJson(this);
}
