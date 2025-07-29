// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

part 'validation_error.g.dart';

@JsonSerializable()
class ValidationError {
  const ValidationError({
    required this.loc,
    required this.msg,
    required this.type,
  });
  
  factory ValidationError.fromJson(Map<String, Object?> json) => _$ValidationErrorFromJson(json);
  
  final List<dynamic> loc;
  final String msg;
  final String type;

  Map<String, Object?> toJson() => _$ValidationErrorToJson(this);
}
