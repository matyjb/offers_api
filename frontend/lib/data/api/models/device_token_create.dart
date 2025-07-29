// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

part 'device_token_create.g.dart';

@JsonSerializable()
class DeviceTokenCreate {
  const DeviceTokenCreate({
    required this.token,
  });
  
  factory DeviceTokenCreate.fromJson(Map<String, Object?> json) => _$DeviceTokenCreateFromJson(json);
  
  final String token;

  Map<String, Object?> toJson() => _$DeviceTokenCreateToJson(this);
}
