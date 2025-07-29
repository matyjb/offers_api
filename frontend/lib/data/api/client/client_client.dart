// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:retrofit/retrofit.dart';

import '../models/offer_extended.dart';
import '../models/user_create.dart';
import '../models/user_extended.dart';

part 'client_client.g.dart';

@RestApi()
abstract class ClientClient {
  factory ClientClient(Dio dio, {String? baseUrl}) = _ClientClient;

  /// Get Current User
  @GET('/api/v1/user')
  Future<UserExtended> getCurrentUserApiV1UserGet({
    @Header('authorization') String? authorization,
  });

  /// Create User
  @POST('/api/v1/user')
  Future<UserExtended> createUserApiV1UserPost({
    @Body() required UserCreate body,
    @Header('authorization') String? authorization,
  });

  /// Get Users
  @GET('/api/v1/users')
  Future<List<UserExtended>> getUsersApiV1UsersGet({
    @Header('authorization') String? authorization,
  });

  /// Delete Offer
  @DELETE('/api/v1/offer/{offer_id}')
  Future<OfferExtended> deleteOfferApiV1OfferOfferIdDelete({
    @Path('offer_id') required String offerId,
    @Header('authorization') String? authorization,
  });
}
