// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  const User({
    required this.email,
    required this.id,
    this.isAdmin = false,
    this.channelsIds = const [],
    this.deviceTokensIds = const [],
  });
  
  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
  
  final String email;
  @JsonKey(name: 'is_admin')
  final bool isAdmin;
  final String id;
  @JsonKey(name: 'channels_ids')
  final List<String> channelsIds;
  @JsonKey(name: 'device_tokens_ids')
  final List<String> deviceTokensIds;

  Map<String, Object?> toJson() => _$UserToJson(this);
}
