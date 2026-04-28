import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:talam/features/auth/data/auth_repository.dart';
import 'package:talam/features/auth/presentation/providers/current_user.dart';
import 'package:talam/features/auth/presentation/screens/login_screen.dart';
import 'package:talam/features/home/presentation/screen/home_screen.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  // Keep this provider alive for the whole app — the router must not be
  // disposed while the user is navigating.
  ref.keepAlive();

  final notifier = _AuthRefreshNotifier(ref);
  ref.onDispose(notifier.dispose);

  return GoRouter(
    initialLocation: '/login',
    refreshListenable: notifier,
    redirect: (context, state) {
      // Read directly from the repository so we always see the latest session,
      // even if Riverpod providers haven't rebuilt yet.
      final session = ref.read(authRepositoryProvider).currentUser;
      final loggedIn = session != null;
      final goingToLogin = state.matchedLocation == '/login';

      if (!loggedIn && !goingToLogin) return '/login';
      if (loggedIn && goingToLogin) return '/';
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
    // Subscribe to the raw Supabase auth stream — this never misses events.
    _sub = ref
        .read(authRepositoryProvider)
        .authStateChanges()
        .listen((_) => notifyListeners());
  }

  late final StreamSubscription _sub;

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }
}
