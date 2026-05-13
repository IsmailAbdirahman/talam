import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
    @JsonKey(name: 'translations', fromJson: _translationsFromJson)
    required final Map<String, String> translations,
  }) = _QuranVerse;

  factory QuranVerse.fromJson(Map<String, dynamic> json) =>
      _$QuranVerseFromJson(json);
}

Map<String, String> _translationsFromJson(Map<String, dynamic> json) {
  return {
    'sahih_international': json['sahih_international'] as String,
    'pickthall': json['pickthall'] as String,
  };
}

@freezed
abstract class QuranAyah with _$QuranAyah {
  const factory QuranAyah({
    required final QuranSurah surah,
    required final QuranVerse verse,
  }) = _QuranAyah;

  factory QuranAyah.fromJson(Map<String, dynamic> json) =>
      _$QuranAyahFromJson(json);
}
