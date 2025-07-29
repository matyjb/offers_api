// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:retrofit/retrofit.dart';

import '../models/offer_create.dart';
import '../models/offer_extended.dart';

part 'offers_client.g.dart';

@RestApi()
abstract class OffersClient {
  factory OffersClient(Dio dio, {String? baseUrl}) = _OffersClient;

  /// Get Offers.
  ///
  /// Get all available offers.
  @GET('/api/v1/offers')
  Future<List<OfferExtended>> getOffersApiV1OffersGet({
    @Header('authorization') String? authorization,
  });

  /// Create Offer.
  ///
  /// Create a new offer (admin only).
  @POST('/api/v1/offer')
  Future<OfferExtended> createOfferApiV1OfferPost({
    @Body() required OfferCreate body,
    @Header('authorization') String? authorization,
  });
}
