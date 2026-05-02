import 'package:flutter/material.dart';
import 'package:talam/features/common/page_view_widget.dart';
import 'package:talam/features/home/domain/quran_ayah.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 194, 194, 194),
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Color.fromARGB(255, 194, 194, 194),

        leading: CloseButton(onPressed: () => Navigator.pop(context)),
      ),
      body: PageViewWidget(data: quranAyahsData),
    );
  }
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
