// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

import 'attachment.dart';
import 'channel.dart';

part 'offer_extended.g.dart';

@JsonSerializable()
class OfferExtended {
  const OfferExtended({
    required this.title,
    required this.description,
    required this.image,
    required this.expirationDate,
    required this.id,
    this.attachmentsIds = const [],
    this.channelsIds = const [],
    this.attachments = const [],
    this.channels = const [],
  });
  
  factory OfferExtended.fromJson(Map<String, Object?> json) => _$OfferExtendedFromJson(json);
  
  final String title;
  final String description;
  final String image;
  @JsonKey(name: 'expiration_date')
  final DateTime expirationDate;
  final String id;
  @JsonKey(name: 'attachments_ids')
  final List<String> attachmentsIds;
  @JsonKey(name: 'channels_ids')
  final List<String> channelsIds;
  final List<Attachment> attachments;
  final List<Channel> channels;

  Map<String, Object?> toJson() => _$OfferExtendedToJson(this);
}
