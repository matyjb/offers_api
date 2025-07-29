// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

import 'user.dart';

part 'device_token_extended.g.dart';

@JsonSerializable()
class DeviceTokenExtended {
  const DeviceTokenExtended({
    required this.token,
    required this.id,
    required this.expirationDate,
    this.userId,
    this.user,
  });
  
  factory DeviceTokenExtended.fromJson(Map<String, Object?> json) => _$DeviceTokenExtendedFromJson(json);
  
  final String token;
  final String id;
  @JsonKey(name: 'expiration_date')
  final DateTime expirationDate;
  @JsonKey(name: 'user_id')
  final String? userId;
  final User? user;

  Map<String, Object?> toJson() => _$DeviceTokenExtendedToJson(this);
}
