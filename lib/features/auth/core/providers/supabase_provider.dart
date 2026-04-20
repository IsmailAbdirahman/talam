import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Exposes the globally-initialized [SupabaseClient] to the whole app.
///
/// `Supabase.initialize(...)` must be called in `main()` before the app runs.
final supabaseClientProvider = Provider<SupabaseClient>((ref) {
  return Supabase.instance.client;
});
