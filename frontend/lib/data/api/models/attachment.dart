// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

part 'attachment.g.dart';

@JsonSerializable()
class Attachment {
  const Attachment({
    required this.fileName,
    required this.url,
    required this.id,
    this.offerId,
  });
  
  factory Attachment.fromJson(Map<String, Object?> json) => _$AttachmentFromJson(json);
  
  @JsonKey(name: 'file_name')
  final String fileName;
  final String url;
  final String id;
  @JsonKey(name: 'offer_id')
  final String? offerId;

  Map<String, Object?> toJson() => _$AttachmentToJson(this);
}
