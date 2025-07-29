// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceToken _$DeviceTokenFromJson(Map<String, dynamic> json) => DeviceToken(
  token: json['token'] as String,
  id: json['id'] as String,
  expirationDate: DateTime.parse(json['expiration_date'] as String),
  userId: json['user_id'] as String?,
);

Map<String, dynamic> _$DeviceTokenToJson(DeviceToken instance) =>
    <String, dynamic>{
      'token': instance.token,
      'id': instance.id,
      'expiration_date': instance.expirationDate.toIso8601String(),
      'user_id': instance.userId,
    };
