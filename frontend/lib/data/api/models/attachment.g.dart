// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attachment _$AttachmentFromJson(Map<String, dynamic> json) => Attachment(
  fileName: json['file_name'] as String,
  url: json['url'] as String,
  id: json['id'] as String,
  offerId: json['offer_id'] as String?,
);

Map<String, dynamic> _$AttachmentToJson(Attachment instance) =>
    <String, dynamic>{
      'file_name': instance.fileName,
      'url': instance.url,
      'id': instance.id,
      'offer_id': instance.offerId,
    };
