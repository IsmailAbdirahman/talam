import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TranslationNotifier extends Notifier<String> {
  static const _key = 'translation_key';

  @override
  String build() {
    _loadTranslation();
    return 'sahih_international';
  }

  Future<void> _loadTranslation() async {
    final prefs = await SharedPreferences.getInstance();
    state = prefs.getString(_key) ?? 'sahih_international';
  }

  Future<void> setTranslation(String key) async {
    final prefs = await SharedPreferences.getInstance();
    state = key;
    await prefs.setString(_key, key);
  }
}

final translationProvider = NotifierProvider<TranslationNotifier, String>(
  TranslationNotifier.new,
);
