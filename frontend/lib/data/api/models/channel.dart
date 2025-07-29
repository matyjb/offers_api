// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

part 'channel.g.dart';

@JsonSerializable()
class Channel {
  const Channel({
    required this.name,
    required this.id,
    this.usersIds = const [],
    this.offersIds = const [],
  });
  
  factory Channel.fromJson(Map<String, Object?> json) => _$ChannelFromJson(json);
  
  final String name;
  final String id;
  @JsonKey(name: 'users_ids')
  final List<String> usersIds;
  @JsonKey(name: 'offers_ids')
  final List<String> offersIds;

  Map<String, Object?> toJson() => _$ChannelToJson(this);
}
