import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talam/features/auth/data/auth_repository.dart';
import 'package:talam/features/auth/presentation/screens/login_screen.dart';
import 'package:talam/features/fav/presentation/screen/fav.dart';
import 'package:talam/features/home/presentation/screen/home_screen.dart';
import 'package:talam/features/onboarding/presentation/onboarding_screen.dart';
import 'package:talam/features/profile/presentation/screen/profile.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  ref.keepAlive();

  final notifier = _AuthRefreshNotifier(ref);
  ref.onDispose(notifier.dispose);

  return GoRouter(
    initialLocation: '/onboarding',
    refreshListenable: notifier,
    redirect: (context, state) async {
      final prefs = await SharedPreferences.getInstance();
      final onboardingDone = prefs.getBool('onboarding_done') ?? false;

      final user = ref.read(authRepositoryProvider).currentUser;
      final loggedIn = user != null;

      final loc = state.matchedLocation;
      final goingToOnboard = loc == '/onboarding';
      final goingToLogin = loc == '/login';

      // First-time user — force onboarding
      if (!onboardingDone && !goingToOnboard) return '/onboarding';

      // Onboarded but not logged in — force login
      if (onboardingDone && !loggedIn && !goingToLogin) return '/login';

      // Onboarded + logged in but on login/onboarding screen — go home
      if (onboardingDone && loggedIn && (goingToOnboard || goingToLogin))
        return '/';

      return null;
    },
    routes: [
      GoRoute(
        path: '/onboarding',
        builder: (_, __) => const OnboardingScreen(),
      ),
      GoRoute(path: '/login', builder: (_, __) => const LoginScreen()),
      GoRoute(
        path: '/',
        builder: (_, __) => Home(
          profileBuilder: (context) => ProfileScreen(
            onOpenFavourites: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const FavScreen()),
            ),
          ),
        ),
      ),
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
