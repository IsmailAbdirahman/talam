import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/auth_repository.dart';

part 'auth_controller.g.dart';

@Riverpod(keepAlive: true)
class AuthController extends _$AuthController {
  bool isGoogleLoading = false;
  bool isAppleLoading = false;
  @override
  Future<void> build() async {}

  Future<void> signInWithGoogle() async {
    isGoogleLoading = true;
    state = const AsyncLoading();
    final result = await AsyncValue.guard(
      () => ref.read(authRepositoryProvider).signInWithGoogle(),
    );
    isGoogleLoading = false;
    state = result;
  }

  Future<void> signInWithApple() async {
    isAppleLoading = true;
    state = const AsyncLoading();
    final result = await AsyncValue.guard(
      () => ref.read(authRepositoryProvider).signInWithApple(),
    );
    isAppleLoading = false;
    state = result;
  }

  Future<void> signOut() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(authRepositoryProvider).signOut(),
    );
  }
}
