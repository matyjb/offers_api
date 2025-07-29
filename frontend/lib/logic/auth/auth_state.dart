part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.unknown() = _Unknown;
  const factory AuthState.authenticated(User user) = _Authenticated;
  const factory AuthState.unauthenticated([String? errorMessage]) = _Unauthenticated;
}
