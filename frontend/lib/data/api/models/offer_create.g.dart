// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_create.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfferCreate _$OfferCreateFromJson(Map<String, dynamic> json) => OfferCreate(
  title: json['title'] as String,
  description: json['description'] as String,
  image: json['image'] as String,
  expirationDate: DateTime.parse(json['expiration_date'] as String),
  channelIds:
      (json['channel_ids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
);

Map<String, dynamic> _$OfferCreateToJson(OfferCreate instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
      'expiration_date': instance.expirationDate.toIso8601String(),
      'channel_ids': instance.channelIds,
    };
