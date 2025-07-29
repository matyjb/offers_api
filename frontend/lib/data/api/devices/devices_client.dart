// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:retrofit/retrofit.dart';

import '../models/device_token_create.dart';
import '../models/device_token_extended.dart';

part 'devices_client.g.dart';

@RestApi()
abstract class DevicesClient {
  factory DevicesClient(Dio dio, {String? baseUrl}) = _DevicesClient;

  /// Register Device Token
  @POST('/api/v1/device_token')
  Future<DeviceTokenExtended> registerDeviceTokenApiV1DeviceTokenPost({
    @Body() required DeviceTokenCreate body,
    @Header('authorization') String? authorization,
  });
}
