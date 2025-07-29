// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

part 'offer_create.g.dart';

@JsonSerializable()
class OfferCreate {
  const OfferCreate({
    required this.title,
    required this.description,
    required this.image,
    required this.expirationDate,
    this.channelIds = const [],
  });
  
  factory OfferCreate.fromJson(Map<String, Object?> json) => _$OfferCreateFromJson(json);
  
  final String title;
  final String description;
  final String image;
  @JsonKey(name: 'expiration_date')
  final DateTime expirationDate;
  @JsonKey(name: 'channel_ids')
  final List<String> channelIds;

  Map<String, Object?> toJson() => _$OfferCreateToJson(this);
}
