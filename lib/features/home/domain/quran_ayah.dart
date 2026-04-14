class QuranAyah {
  final int surahNumber;
  final int ayahNumber;
  final String surahNameEnglish;
  final String arabic;
  final String transliteration;
  final String translation;

  QuranAyah({
    required this.surahNumber,
    required this.ayahNumber,
    required this.surahNameEnglish,
    required this.arabic,
    required this.transliteration,
    required this.translation,
  });

  // fromJson lives here — still only parses its OWN data
  factory QuranAyah.fromJson(Map<String, dynamic> json) {
    final surah = json['data']['surah'];
    final verse = json['data']['verse'];

    return QuranAyah(
      surahNumber: surah['number'],
      ayahNumber: verse['number'],
      surahNameEnglish: surah['name_english'],
      arabic: verse['arabic'],
      transliteration: verse['transliteration'],
      translation: verse['translations']['sahih_international'],
    );
  }
}

final List<QuranAyah> quranAyahsData = [
  QuranAyah(
    surahNumber: 1,
    ayahNumber: 1,
    surahNameEnglish: 'Al-Fatihah',
    arabic: 'بِسْمِ ٱللَّهِ ٱلرَّحْمَـٰنِ ٱلرَّحِيمِ',
    transliteration: 'Bismillahi r-rahmani r-raheem',
    translation:
        'In the name of Allah, the Entirely Merciful, the Especially Merciful.',
  ),
  QuranAyah(
    surahNumber: 2,
    ayahNumber: 255,
    surahNameEnglish: 'Al-Baqarah',
    arabic: 'ٱللَّهُ لَآ إِلَـٰهَ إِلَّا هُوَ ٱلْحَىُّ ٱلْقَيُّومُ',
    transliteration: 'Allahu la ilaha illa huwal hayyul qayyum',
    translation:
        'Allah - there is no deity except Him, the Ever-Living, the Sustainer of existence.',
  ),
  QuranAyah(
    surahNumber: 112,
    ayahNumber: 1,
    surahNameEnglish: 'Al-Ikhlas',
    arabic: 'قُلْ هُوَ ٱللَّهُ أَحَدٌ',
    transliteration: 'Qul huwa Allahu ahad',
    translation: 'Say: He is Allah, the One.',
  ),
  QuranAyah(
    surahNumber: 36,
    ayahNumber: 1,
    surahNameEnglish: 'Ya-Sin',
    arabic: 'يسٓ',
    transliteration: 'Ya-seen',
    translation: 'Ya, Seen.',
  ),
  QuranAyah(
    surahNumber: 55,
    ayahNumber: 13,
    surahNameEnglish: 'Ar-Rahman',
    arabic: 'فَبِأَىِّ ءَالَآءِ رَبِّكُمَا تُكَذِّبَانِ',
    transliteration: "Fabiayyi ala'i rabbikuma tukadhdhibaan",
    translation: 'So which of the favors of your Lord would you deny?',
  ),
];
