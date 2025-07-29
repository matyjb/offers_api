// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
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
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'email': instance.email,
  'is_admin': instance.isAdmin,
  'id': instance.id,
  'channels_ids': instance.channelsIds,
  'device_tokens_ids': instance.deviceTokensIds,
};
