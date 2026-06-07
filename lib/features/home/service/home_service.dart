import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:talam/features/home/domain/quran_ayah.dart';
import 'package:talam/features/home/repository/ayah_source.dart';

class HttpAyahSource implements AyahSource {
  HttpAyahSource();

  @override
  Future<QuranAyah> fetchRandomAyah(int surah, int ayah) async {
    final url = Uri.parse(
      'https://www.ummahapi.com/api/quran/surah/$surah/ayah/$ayah',
    );

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return QuranAyah.fromJson(json['data']);
    } else {
      throw Exception('Failed to show data: ${response.statusCode}');
    }
  }
}
