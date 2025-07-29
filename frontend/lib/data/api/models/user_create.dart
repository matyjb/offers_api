// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

part 'user_create.g.dart';

@JsonSerializable()
class UserCreate {
  const UserCreate({
    required this.email,
    this.isAdmin = false,
  });
  
  factory UserCreate.fromJson(Map<String, Object?> json) => _$UserCreateFromJson(json);
  
  final String email;
  @JsonKey(name: 'is_admin')
  final bool isAdmin;

  Map<String, Object?> toJson() => _$UserCreateToJson(this);
}
