// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

import 'channel.dart';
import 'device_token.dart';

part 'user_extended.g.dart';

@JsonSerializable()
class UserExtended {
  const UserExtended({
    required this.email,
    required this.id,
    this.isAdmin = false,
    this.channelsIds = const [],
    this.deviceTokensIds = const [],
    this.channels = const [],
    this.deviceTokens = const [],
  });
  
  factory UserExtended.fromJson(Map<String, Object?> json) => _$UserExtendedFromJson(json);
  
  final String email;
  @JsonKey(name: 'is_admin')
  final bool isAdmin;
  final String id;
  @JsonKey(name: 'channels_ids')
  final List<String> channelsIds;
  @JsonKey(name: 'device_tokens_ids')
  final List<String> deviceTokensIds;
  final List<Channel> channels;
  @JsonKey(name: 'device_tokens')
  final List<DeviceToken> deviceTokens;

  Map<String, Object?> toJson() => _$UserExtendedToJson(this);
}
