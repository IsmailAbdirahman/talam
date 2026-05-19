import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class TafsirService {
  Future<String> getTafsir({
    required int surah,
    required int ayah,
    required int tafsirId,
  }) async {
    final url = Uri.parse(
      'https://api.quran.com/api/v4/tafsirs/$tafsirId/by_ayah/$surah:$ayah',
    );
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final text = json['tafsir']['text'] as String;
      return text.replaceAll(RegExp(r'<[^>]*>'), '').trim();
    } else {
      throw Exception('Failed to load tafsir: ${response.statusCode}');
    }
  }
}

final tafsirServiceProvider = Provider<TafsirService>((ref) => TafsirService());

// Language preference — English (169) is default, Arabic is 14
class TafsirLanguageNotifier extends Notifier<int> {
  static const _key = 'tafsir_lang';

  @override
  int build() {
    _load();
    return 169;
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    state = prefs.getInt(_key) ?? 169;
  }

  Future<void> setLanguage(int id) async {
    final prefs = await SharedPreferences.getInstance();
    state = id;
    await prefs.setInt(_key, id);
  }
}

final tafsirLanguageProvider = NotifierProvider<TafsirLanguageNotifier, int>(
  TafsirLanguageNotifier.new,
);

typedef TafsirParams = ({int surah, int ayah, int tafsirId});

final tafsirContentProvider = FutureProvider.family<String, TafsirParams>((
  ref,
  params,
) async {
  final service = ref.watch(tafsirServiceProvider);
  return service.getTafsir(
    surah: params.surah,
    ayah: params.ayah,
    tafsirId: params.tafsirId,
  );
});
