// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_extended.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserExtended _$UserExtendedFromJson(Map<String, dynamic> json) => UserExtended(
  email: json['email'] as String,
  id: json['id'] as String,
  isAdmin: json['is_admin'] as bool? ?? false,
  channelsIds:
      (json['channels_ids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  deviceTokensIds:
      (json['device_tokens_ids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  channels:
      (json['channels'] as List<dynamic>?)
          ?.map((e) => Channel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  deviceTokens:
      (json['device_tokens'] as List<dynamic>?)
          ?.map((e) => DeviceToken.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$UserExtendedToJson(UserExtended instance) =>
    <String, dynamic>{
      'email': instance.email,
      'is_admin': instance.isAdmin,
      'id': instance.id,
      'channels_ids': instance.channelsIds,
      'device_tokens_ids': instance.deviceTokensIds,
      'channels': instance.channels,
      'device_tokens': instance.deviceTokens,
    };
