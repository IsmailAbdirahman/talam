/// Centralized Supabase configuration.
///
/// Replace these values with your own Supabase project's credentials.
/// For production, load these from `--dart-define` env vars instead of
/// hard-coding them.
class SupabaseConfig {
  SupabaseConfig._();

  /// e.g. https://xxxxxxxxxxxx.supabase.co
  static const String url = String.fromEnvironment(
    'SUPABASE_URL',
    defaultValue: 'https://isrzpjghuzxmkhyaqnaf.supabase.co',
  );

  /// The anon/public key (safe to ship in-app).
  static const String anonKey = String.fromEnvironment(
    'SUPABASE_ANON_KEY',
    defaultValue:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlzcnpwamdodXp4bWtoeWFxbmFmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzY1OTAxMjQsImV4cCI6MjA5MjE2NjEyNH0.DgU8WdVc2kY1zPfsCLHAbXOsWlCcTPZIS_LV8C97F2s',
  );

  /// Google OAuth Web Client ID (required for native Google sign-in -> Supabase).
  /// Create in Google Cloud Console -> APIs & Services -> Credentials.
  static const String googleWebClientId = String.fromEnvironment(
    'GOOGLE_WEB_CLIENT_ID',
    defaultValue:
        '458235562976-03oaupqhc4c40odj2hnpfg58ne5qbtsf.apps.googleusercontent.com',
  );

  /// iOS Google client ID (from GoogleService-Info.plist / Google Cloud).
  static const String googleIosClientId = String.fromEnvironment(
    'GOOGLE_IOS_CLIENT_ID',
    defaultValue:
        '458235562976-08u2a6j9bi3nhj3r4jt22etsdhlk7fih.apps.googleusercontent.com',
  );
}
