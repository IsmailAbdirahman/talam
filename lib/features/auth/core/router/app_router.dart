import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:talam/features/auth/data/auth_repository.dart';
import 'package:talam/features/auth/presentation/screens/login_screen.dart';
import 'package:talam/features/home/presentation/screen/home_screen.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  ref.keepAlive();

  final notifier = _AuthRefreshNotifier(ref);

  ref.onDispose(notifier.dispose);

  return GoRouter(
    initialLocation: '/login',

    refreshListenable: notifier,

    redirect: (context, state) {
      // ❌ REMOVED
      // final session = ref.read(authRepositoryProvider).currentUser;

      final user = ref.read(authRepositoryProvider).currentUser; // ✅ ADDED

      // ❌ REMOVED
      // final loggedIn = session != null;

      final loggedIn = user != null; // ✅ ADDED

      final goingToLogin = state.matchedLocation == '/login';

      if (!loggedIn && !goingToLogin) {
        return '/login';
      }

      if (loggedIn && goingToLogin) {
        return '/';
      }

      return null;
    },

    routes: [
      GoRoute(path: '/login', builder: (_, __) => const LoginScreen()),

      GoRoute(path: '/', builder: (_, __) => const Home()),
    ],
  );
});

class _AuthRefreshNotifier extends ChangeNotifier {
  _AuthRefreshNotifier(Ref ref) {
    _sub = ref.read(authRepositoryProvider).authStateChanges().listen((_) {
      notifyListeners();
    });
  }

  late final StreamSubscription _sub;

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }
}
