import 'package:talam/features/home/domain/quran_ayah.dart';

abstract class AyahSource {
  Future<QuranAyah> fetchRandomAyah(int surah, int ayah);
}
