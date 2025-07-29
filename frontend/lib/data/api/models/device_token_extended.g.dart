// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_token_extended.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceTokenExtended _$DeviceTokenExtendedFromJson(Map<String, dynamic> json) =>
    DeviceTokenExtended(
      token: json['token'] as String,
      id: json['id'] as String,
      expirationDate: DateTime.parse(json['expiration_date'] as String),
      userId: json['user_id'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DeviceTokenExtendedToJson(
  DeviceTokenExtended instance,
) => <String, dynamic>{
  'token': instance.token,
  'id': instance.id,
  'expiration_date': instance.expirationDate.toIso8601String(),
  'user_id': instance.userId,
  'user': instance.user,
};
