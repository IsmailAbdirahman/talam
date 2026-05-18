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
    @JsonKey(
      name: 'translations',
      fromJson: _translationFromJson,
      toJson: _translationToJson,
    )
    required final String translation,
  }) = _QuranVerse;

  factory QuranVerse.fromJson(Map<String, dynamic> json) =>
      _$QuranVerseFromJson(json);
}

String _translationFromJson(Map<String, dynamic> json) =>
    json['sahih_international'] as String;

Map<String, dynamic> _translationToJson(String translation) => {
  'sahih_international': translation,
};

@freezed
abstract class QuranAyah with _$QuranAyah {
  const factory QuranAyah({
    required final QuranSurah surah,
    required final QuranVerse verse,
  }) = _QuranAyah;

  factory QuranAyah.fromJson(Map<String, dynamic> json) =>
      _$QuranAyahFromJson(json);
}
