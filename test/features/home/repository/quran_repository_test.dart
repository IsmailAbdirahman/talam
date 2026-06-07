import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talam/features/home/domain/quran_ayah.dart';
import 'package:talam/features/home/repository/ayah_source.dart';
import 'package:talam/features/home/repository/quran_repositary.dart';

// Fake adapter — returns fixed QuranAyah, counts calls
class FakeAyahSource implements AyahSource {
  int callCount = 0;

  @override
  Future<QuranAyah> fetchRandomAyah(int surah, int ayah) async {
    callCount++;
    return _ayah(surah, ayah);
  }
}

QuranAyah _ayah(int surah, int ayahNumber) => QuranAyah(
      surah: QuranSurah(
        number: surah,
        nameArabic: 'سورة',
        nameEnglish: 'Surah $surah',
        nameTranslation: 'Chapter $surah',
      ),
      verse: QuranVerse(
        verseKey: '$surah:$ayahNumber',
        ayah: ayahNumber,
        arabic: 'آية',
        transliteration: 'transliteration',
        translation: 'translation',
      ),
    );

String _todayStr() {
  final d = DateTime.now();
  return '${d.year}-${d.month}-${d.day}';
}

String _yesterdayStr() {
  final d = DateTime.now().subtract(const Duration(days: 1));
  return '${d.year}-${d.month}-${d.day}';
}

String _encodedCache() {
  final ayahs = List.generate(15, (i) => _ayah(i + 1, 1));
  return jsonEncode(ayahs.map((a) => a.toJson()).toList());
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  group('QuranRepositary', () {
    test('returns cached ayahs when date matches — no network call', () async {
      SharedPreferences.setMockInitialValues({
        'todays_ayahs': _encodedCache(),
        'todays_date': _todayStr(),
      });

      final source = FakeAyahSource();
      final result = await QuranRepositary(source).getQuranAyaat();

      expect(result.length, 15);
      expect(source.callCount, 0);
    });

    test('fetches fresh when cache date is yesterday', () async {
      SharedPreferences.setMockInitialValues({
        'todays_ayahs': _encodedCache(),
        'todays_date': _yesterdayStr(),
      });

      final source = FakeAyahSource();
      final result = await QuranRepositary(source).getQuranAyaat();

      expect(result.length, 15);
      expect(source.callCount, 15);
    });

    test('fetches fresh when no cache exists', () async {
      final source = FakeAyahSource();
      final result = await QuranRepositary(source).getQuranAyaat();

      expect(result.length, 15);
      expect(source.callCount, 15);
    });

    test('forceRefresh bypasses valid cache', () async {
      SharedPreferences.setMockInitialValues({
        'todays_ayahs': _encodedCache(),
        'todays_date': _todayStr(),
      });

      final source = FakeAyahSource();
      final result =
          await QuranRepositary(source).getQuranAyaat(forceRefresh: true);

      expect(result.length, 15);
      expect(source.callCount, 15);
    });

    test('saves today\'s date to cache after fresh fetch', () async {
      final source = FakeAyahSource();
      await QuranRepositary(source).getQuranAyaat();

      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getString('todays_date'), _todayStr());
    });
  });
}
