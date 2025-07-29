// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_create.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserCreate _$UserCreateFromJson(Map<String, dynamic> json) => UserCreate(
  email: json['email'] as String,
  isAdmin: json['is_admin'] as bool? ?? false,
);

Map<String, dynamic> _$UserCreateToJson(UserCreate instance) =>
    <String, dynamic>{'email': instance.email, 'is_admin': instance.isAdmin};
