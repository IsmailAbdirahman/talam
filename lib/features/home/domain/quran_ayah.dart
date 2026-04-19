import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quran_ayah.freezed.dart';
part 'quran_ayah.g.dart';

@freezed
abstract class QuranSurah with _$QuranSurah {
  const factory QuranSurah({
    required final int number,
    @JsonKey(name: 'name_arabic') required final String nameArabic,
    @JsonKey(name: 'name_english') required final String nameEnglish,
    @JsonKey(name: 'name_translation') required final String nameTranslation,
  }) = _QuranSurah;

  factory QuranSurah.fromJson(Map<String, dynamic> json) =>
      _$QuranSurahFromJson(json);
}

@freezed
abstract class QuranVerse with _$QuranVerse {
  const factory QuranVerse({
    @JsonKey(name: 'verse_key') required final String verseKey,
    required final int ayah,
    required final String arabic,
    required final String transliteration,
    @JsonKey(name: 'translations', fromJson: _translationFromJson)
    required final String translation,
  }) = _QuranVerse;

  factory QuranVerse.fromJson(Map<String, dynamic> json) =>
      _$QuranVerseFromJson(json);
}

String _translationFromJson(Map<String, dynamic> json) =>
    json['sahih_international'] as String;

@freezed
abstract class QuranAyah with _$QuranAyah {
  const factory QuranAyah({
    required final QuranSurah surah,
    required final QuranVerse verse,
  }) = _QuranAyah;

  factory QuranAyah.fromJson(Map<String, dynamic> json) =>
      _$QuranAyahFromJson(json);
}

final List<QuranAyah> quranAyahsData = [
  QuranAyah(
    surah: QuranSurah(
      number: 1,
      nameArabic: 'الفاتحة',
      nameEnglish: 'Al-Fatihah',
      nameTranslation: 'The Opening',
    ),
    verse: QuranVerse(
      verseKey: '1:1',
      ayah: 1,
      arabic: 'بِسْمِ ٱللَّهِ ٱلرَّحْمَـٰنِ ٱلرَّحِيمِ',
      transliteration: 'Bismillahi r-rahmani r-raheem',
      translation:
          'In the name of Allah, the Entirely Merciful, the Especially Merciful.',
    ),
  ),
  QuranAyah(
    surah: QuranSurah(
      number: 2,
      nameArabic: 'البقرة',
      nameEnglish: 'Al-Baqarah',
      nameTranslation: 'The Cow',
    ),
    verse: QuranVerse(
      verseKey: '2:255',
      ayah: 255,
      arabic: 'ٱللَّهُ لَآ إِلَـٰهَ إِلَّا هُوَ ٱلْحَىُّ ٱلْقَيُّومُ',
      transliteration: 'Allahu la ilaha illa huwal hayyul qayyum',
      translation:
          'Allah - there is no deity except Him, the Ever-Living, the Sustainer of existence.',
    ),
  ),
  QuranAyah(
    surah: QuranSurah(
      number: 55,
      nameArabic: 'الرحمن',
      nameEnglish: 'Ar-Rahman',
      nameTranslation: 'The Beneficent',
    ),
    verse: QuranVerse(
      verseKey: '55:13',
      ayah: 13,
      arabic: 'فَبِأَىِّ ءَالَآءِ رَبِّكُمَا تُكَذِّبَانِ',
      transliteration: "Fabiayyi ala'i rabbikuma tukadhdhibaan",
      translation: 'So which of the favors of your Lord would you deny?',
    ),
  ),
  QuranAyah(
    surah: QuranSurah(
      number: 112,
      nameArabic: 'الإخلاص',
      nameEnglish: 'Al-Ikhlas',
      nameTranslation: 'Sincerity',
    ),
    verse: QuranVerse(
      verseKey: '112:1',
      ayah: 1,
      arabic: 'قُلْ هُوَ ٱللَّهُ أَحَدٌ',
      transliteration: 'Qul huwa Allahu ahad',
      translation: 'Say: He is Allah, the One.',
    ),
  ),
  QuranAyah(
    surah: QuranSurah(
      number: 37,
      nameArabic: 'الصافات',
      nameEnglish: 'As-Saffat',
      nameTranslation: 'Those who set the Ranks',
    ),
    verse: QuranVerse(
      verseKey: '37:81',
      ayah: 81,
      arabic: 'إِنَّهُۥ مِنْ عِبَادِنَا ٱلْمُؤْمِنِينَ',
      transliteration: 'Innahu min AAibadinaalmu/mineen',
      translation: 'Indeed, he was of Our believing servants.',
    ),
  ),
];
