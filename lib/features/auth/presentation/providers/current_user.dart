import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../data/auth_repository.dart';
import '../../domain/app_user.dart';

/// Streams Supabase [AuthState] changes.
///
/// Emits whenever the user signs in, signs out, or the session refreshes.
final authStateChangesProvider = StreamProvider<AuthState>((ref) {
  final repo = ref.watch(authRepositoryProvider);
  return repo.authStateChanges();
});

/// Reactive [AppUser] — null when signed out.
///
/// This is the single source of truth for "who is the current user".
/// Any screen/feature can `ref.watch(currentUserProvider)` to react to
/// login/logout without touching Supabase directly.
final currentUserProvider = Provider<AppUser?>((ref) {
  final authState = ref.watch(authStateChangesProvider);

  // While the auth stream is still emitting its first value, fall back to
  // whatever session is cached on disk (set by Supabase.initialize).
  final user = authState.asData?.value.session?.user ??
      ref.watch(authRepositoryProvider).currentUser;

  if (user == null) return null;
  return AppUser.fromSupabase(user);
});

/// Convenience: the current user's ID. Null when signed out.
///
/// Use this across the app whenever you need the user id
/// (e.g. RLS queries, file paths, analytics).
final currentUserIdProvider = Provider<String?>((ref) {
  return ref.watch(currentUserProvider)?.id;
});
