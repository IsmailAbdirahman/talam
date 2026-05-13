// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_ayah.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuranSurah _$QuranSurahFromJson(Map<String, dynamic> json) => _QuranSurah(
  number: (json['number'] as num).toInt(),
  nameArabic: json['name_arabic'] as String,
  nameEnglish: json['name_english'] as String,
  nameTranslation: json['name_translation'] as String,
);

Map<String, dynamic> _$QuranSurahToJson(_QuranSurah instance) =>
    <String, dynamic>{
      'number': instance.number,
      'name_arabic': instance.nameArabic,
      'name_english': instance.nameEnglish,
      'name_translation': instance.nameTranslation,
    };

_QuranVerse _$QuranVerseFromJson(Map<String, dynamic> json) => _QuranVerse(
  verseKey: json['verse_key'] as String,
  ayah: (json['ayah'] as num).toInt(),
  arabic: json['arabic'] as String,
  transliteration: json['transliteration'] as String,
  translations: _translationsFromJson(
    json['translations'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$QuranVerseToJson(_QuranVerse instance) =>
    <String, dynamic>{
      'verse_key': instance.verseKey,
      'ayah': instance.ayah,
      'arabic': instance.arabic,
      'transliteration': instance.transliteration,
      'translations': instance.translations,
    };

_QuranAyah _$QuranAyahFromJson(Map<String, dynamic> json) => _QuranAyah(
  surah: QuranSurah.fromJson(json['surah'] as Map<String, dynamic>),
  verse: QuranVerse.fromJson(json['verse'] as Map<String, dynamic>),
);

Map<String, dynamic> _$QuranAyahToJson(_QuranAyah instance) =>
    <String, dynamic>{'surah': instance.surah, 'verse': instance.verse};
