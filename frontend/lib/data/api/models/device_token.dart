// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

part 'device_token.g.dart';

@JsonSerializable()
class DeviceToken {
  const DeviceToken({
    required this.token,
    required this.id,
    required this.expirationDate,
    this.userId,
  });
  
  factory DeviceToken.fromJson(Map<String, Object?> json) => _$DeviceTokenFromJson(json);
  
  final String token;
  final String id;
  @JsonKey(name: 'expiration_date')
  final DateTime expirationDate;
  @JsonKey(name: 'user_id')
  final String? userId;

  Map<String, Object?> toJson() => _$DeviceTokenToJson(this);
}
