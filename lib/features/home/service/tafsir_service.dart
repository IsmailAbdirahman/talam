import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class TafsirService {
  Future<String> getTafsir({required int surah, required int ayah}) async {
    final url = Uri.parse(
      'https://api.quran.com/api/v4/tafsirs/169/by_ayah/$surah:$ayah',
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

typedef TafsirParams = ({int surah, int ayah});

final tafsirContentProvider = FutureProvider.family<String, TafsirParams>((
  ref,
  params,
) async {
  final service = ref.watch(tafsirServiceProvider);
  return service.getTafsir(surah: params.surah, ayah: params.ayah);
});
