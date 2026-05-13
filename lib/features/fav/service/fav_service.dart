// features/favourites/repository/favourites_repository.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:talam/features/home/domain/quran_ayah.dart';

class FavouritesRepository {
  final SupabaseClient _client;
  FavouritesRepository(this._client);

  // save ayah
  Future<void> saveAyah(QuranAyah quranAyah) async {
    await _client.from('favourites').insert({
      'user_id': _client.auth.currentUser!.id,
      'surah_number': quranAyah.surah.number,
      'surah_name_english': quranAyah.surah.nameEnglish,
      'ayah_number': quranAyah.verse.ayah,
      'arabic': quranAyah.verse.arabic,
      'translation': quranAyah.verse.translations,
    });
  }

  // remove ayah
  Future<void> removeAyah(int surahNumber, int ayahNumber) async {
    await _client
        .from('favourites')
        .delete()
        .eq('user_id', _client.auth.currentUser!.id)
        .eq('surah_number', surahNumber)
        .eq('ayah_number', ayahNumber);
  }

  Future<List<QuranAyah>> getFavourites() async {
    final response = await _client
        .from('favourites')
        .select()
        .eq('user_id', _client.auth.currentUser!.id)
        .order('created_at', ascending: false);

    return response.map((item) {
      return QuranAyah(
        surah: QuranSurah(
          number: item['surah_number'],
          nameEnglish: item['surah_name_english'],
          nameArabic: '',
          nameTranslation: '',
        ),
        verse: QuranVerse(
          verseKey: '${item['surah_number']}:${item['ayah_number']}',
          ayah: item['ayah_number'],
          arabic: item['arabic'],
          transliteration: '',
          translations: {
            'sahih_international': item['translation'] ?? '',
            'pickthall': item['translation'] ?? '',
          },
        ),
      );
    }).toList();
  }

  // check if ayah is already saved
  Future<bool> isFavourite(int surahNumber, int ayahNumber) async {
    final response = await _client
        .from('favourites')
        .select()
        .eq('user_id', _client.auth.currentUser!.id)
        .eq('surah_number', surahNumber)
        .eq('ayah_number', ayahNumber);
    return response.isNotEmpty;
  }
}

final favouritesRepositoryProvider = Provider<FavouritesRepository>((ref) {
  return FavouritesRepository(Supabase.instance.client);
});

final favAyaatProvider = FutureProvider.autoDispose<List<QuranAyah>>((
  ref,
) async {
  final repository = ref.watch(favouritesRepositoryProvider);
  return repository.getFavourites();
});
