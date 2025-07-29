import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:offers/data/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  late final StreamSubscription<User?> _userSubscription;

  AuthBloc({required AuthRepository authRepository})
    : _authRepository = authRepository,
      super(const AuthState.unknown()) {
    // Register event handlers
    on<_Changed>(_onUserChanged);
    on<_SignUpRequested>(_onSignUpRequested);
    on<_SignInRequested>(_onSignInRequested);
    on<_SignOutRequested>(_onSignOutRequested);
    on<_ResetPasswordRequested>(_onResetPasswordRequested);

    // Subscribe to auth state changes
    _userSubscription = _authRepository.authStateChanges.listen(
      (user) => add(_Changed(user: user)),
    );
  }

  // Handle user state changes
  void _onUserChanged(_Changed event, Emitter<AuthState> emit) {
    if (event.user != null) {
      emit(AuthState.authenticated(event.user!));
    } else {
      emit(const AuthState.unauthenticated());
    }
  }

  // Handle sign up
  Future<void> _onSignUpRequested(
    _SignUpRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      await _authRepository.signUp(
        email: event.email,
        password: event.password,
      );
    } catch (e) {
      emit(AuthState.unauthenticated(e.toString()));
    }
  }

  // Handle sign in
  Future<void> _onSignInRequested(
    _SignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      await _authRepository.signIn(
        email: event.email,
        password: event.password,
      );
    } catch (e) {
      emit(AuthState.unauthenticated(e.toString()));
    }
  }

  // Handle sign out
  Future<void> _onSignOutRequested(
    _SignOutRequested event,
    Emitter<AuthState> emit,
  ) async {
    await _authRepository.signOut();
  }

  // Handle password reset
  Future<void> _onResetPasswordRequested(
    _ResetPasswordRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      await _authRepository.resetPassword(email: event.email);
    } catch (e) {
      emit(AuthState.unauthenticated(e.toString()));
    }
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
