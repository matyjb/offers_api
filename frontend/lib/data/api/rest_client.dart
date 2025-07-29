// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:dio/dio.dart';

import 'client/client_client.dart';
import 'devices/devices_client.dart';
import 'offers/offers_client.dart';

/// Offers API `v1.0.0`.
///
/// API for managing offers and user subscriptions.
class RestClient {
  RestClient(
    Dio dio, {
    String? baseUrl,
  })  : _dio = dio,
        _baseUrl = baseUrl;

  final Dio _dio;
  final String? _baseUrl;

  static String get version => '1.0.0';

  ClientClient? _client;
  DevicesClient? _devices;
  OffersClient? _offers;

  ClientClient get client => _client ??= ClientClient(_dio, baseUrl: _baseUrl);

  DevicesClient get devices => _devices ??= DevicesClient(_dio, baseUrl: _baseUrl);

  OffersClient get offers => _offers ??= OffersClient(_dio, baseUrl: _baseUrl);
}
