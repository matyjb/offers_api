// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Channel _$ChannelFromJson(Map<String, dynamic> json) => Channel(
  name: json['name'] as String,
  id: json['id'] as String,
  usersIds:
      (json['users_ids'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  offersIds:
      (json['offers_ids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
);

Map<String, dynamic> _$ChannelToJson(Channel instance) => <String, dynamic>{
  'name': instance.name,
  'id': instance.id,
  'users_ids': instance.usersIds,
  'offers_ids': instance.offersIds,
};
