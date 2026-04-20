import 'dart:convert';
import 'dart:io' show Platform;
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:talam/features/auth/core/config/supabase_config.dart';
import 'package:talam/features/auth/core/providers/supabase_provider.dart';

/// Handles all authentication flows against Supabase.
class AuthRepository {
  AuthRepository(this._client);

  final SupabaseClient _client;

  /// Stream of auth state changes (login / logout / token refresh).
  Stream<AuthState> authStateChanges() => _client.auth.onAuthStateChange;

  /// Currently signed-in user (null if signed out).
  User? get currentUser => _client.auth.currentUser;

  /// Current access token (useful for debug).
  String? get accessToken => _client.auth.currentSession?.accessToken;

  // ---------------------------------------------------------------------------
  // Google Sign-In
  // ---------------------------------------------------------------------------

  /// On iOS/Android we use the native Google SDK and forward the ID token to
  /// Supabase. On web/desktop we fall back to the OAuth browser flow.
  ///
  /// Reference: https://supabase.com/docs/guides/auth/social-login/auth-google
  Future<AuthResponse> signInWithGoogle() async {
    if (kIsWeb || !(Platform.isAndroid || Platform.isIOS)) {
      await _client.auth.signInWithOAuth(
        OAuthProvider.google,
        redirectTo: kIsWeb ? null : 'io.supabase.flutterauth://login-callback/',
      );
      // signInWithOAuth completes later via deep link; return a placeholder.
      // Consumers should rely on authStateChanges() stream instead.
      throw const AuthException(
        'OAuth flow started in browser. Listen to authStateChanges.',
      );
    }

    final googleSignIn = GoogleSignIn(
      clientId: Platform.isIOS ? SupabaseConfig.googleIosClientId : null,
      serverClientId: SupabaseConfig.googleWebClientId,
    );

    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      throw const AuthException('Google sign-in cancelled by user.');
    }

    final googleAuth = await googleUser.authentication;
    final idToken = googleAuth.idToken;
    final accessToken = googleAuth.accessToken;

    if (idToken == null) {
      throw const AuthException('No ID token returned from Google.');
    }

    return _client.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
  }

  // ---------------------------------------------------------------------------
  // Apple Sign-In
  // ---------------------------------------------------------------------------

  /// Sign in with Apple. We use a nonce so Supabase can verify the ID token.
  ///
  /// Reference: https://supabase.com/docs/guides/auth/social-login/auth-apple
  Future<AuthResponse> signInWithApple() async {
    final rawNonce = _generateNonce();
    final hashedNonce = _sha256ofString(rawNonce);

    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: hashedNonce,
    );

    final idToken = credential.identityToken;
    if (idToken == null) {
      throw const AuthException('No identity token from Apple.');
    }

    return _client.auth.signInWithIdToken(
      provider: OAuthProvider.apple,
      idToken: idToken,
      nonce: rawNonce,
    );
  }

  // ---------------------------------------------------------------------------
  // Sign out
  // ---------------------------------------------------------------------------

  Future<void> signOut() => _client.auth.signOut();

  // ---------------------------------------------------------------------------
  // Helpers
  // ---------------------------------------------------------------------------

  String _generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(
      length,
      (_) => charset[random.nextInt(charset.length)],
    ).join();
  }

  String _sha256ofString(String input) {
    final bytes = utf8.encode(input);
    return sha256.convert(bytes).toString();
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(ref.watch(supabaseClientProvider));
});
