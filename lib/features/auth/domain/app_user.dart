import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

/// Domain-level user model used across the app.
///
/// This is decoupled from Supabase's [User] so the rest of the app
/// doesn't depend on the auth SDK directly.
@freezed
abstract class AppUser with _$AppUser {
  const factory AppUser({
    required String id,
    String? email,
    String? fullName,
    String? avatarUrl,
    String? provider,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);

  /// Build an [AppUser] from a Supabase [User].
  factory AppUser.fromSupabase(User user) {
    final meta = user.userMetadata ?? <String, dynamic>{};
    return AppUser(
      id: user.id,
      email: user.email,
      fullName: (meta['full_name'] ?? meta['name']) as String?,
      avatarUrl: (meta['avatar_url'] ?? meta['picture']) as String?,
      provider: user.appMetadata['provider'] as String?,
    );
  }
}
