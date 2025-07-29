// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_extended.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfferExtended _$OfferExtendedFromJson(Map<String, dynamic> json) =>
    OfferExtended(
      title: json['title'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      expirationDate: DateTime.parse(json['expiration_date'] as String),
      id: json['id'] as String,
      attachmentsIds:
          (json['attachments_ids'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      channelsIds:
          (json['channels_ids'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      attachments:
          (json['attachments'] as List<dynamic>?)
              ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      channels:
          (json['channels'] as List<dynamic>?)
              ?.map((e) => Channel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$OfferExtendedToJson(OfferExtended instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
      'expiration_date': instance.expirationDate.toIso8601String(),
      'id': instance.id,
      'attachments_ids': instance.attachmentsIds,
      'channels_ids': instance.channelsIds,
      'attachments': instance.attachments,
      'channels': instance.channels,
    };
