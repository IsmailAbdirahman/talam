import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/auth_repository.dart';

part 'auth_controller.g.dart';

@immutable
class AuthState {
  final bool isGoogleLoading;
  final bool isAppleLoading;
  final Object? error;

  const AuthState({
    this.isGoogleLoading = false,
    this.isAppleLoading = false,
    this.error,
  });

  static const idle = AuthState();
}

@Riverpod(keepAlive: true)
class AuthController extends _$AuthController {
  @override
  AuthState build() => AuthState.idle;

  Future<void> signInWithGoogle() async {
    state = const AuthState(isGoogleLoading: true);
    try {
      await ref.read(authRepositoryProvider).signInWithGoogle();
      state = AuthState.idle;
    } catch (e) {
      state = AuthState(error: e);
    }
  }

  Future<void> signInWithApple() async {
    state = const AuthState(isAppleLoading: true);
    try {
      await ref.read(authRepositoryProvider).signInWithApple();
      state = AuthState.idle;
    } catch (e) {
      state = AuthState(error: e);
    }
  }

  Future<void> signOut() async {
    try {
      await ref.read(authRepositoryProvider).signOut();
    } catch (_) {}
  }

  Future<void> deleteAccount() async {
    await ref.read(authRepositoryProvider).deleteAccount();
  }
}
