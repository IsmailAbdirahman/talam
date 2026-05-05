// features/favourites/controller/favourites_controller.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:talam/features/home/domain/quran_ayah.dart';

import '../service/fav_service.dart';

part 'fav_repository.g.dart';

@riverpod
class FavouritesController extends _$FavouritesController {
  @override
  Future<List<QuranAyah>> build() async {
    return ref.read(favouritesRepositoryProvider).getFavourites();
  }

  Future<void> toggleFavourite(QuranAyah ayah) async {
    final repo = ref.read(favouritesRepositoryProvider);
    final isSaved = await repo.isFavourite(ayah.surah.number, ayah.verse.ayah);

    if (isSaved) {
      await repo.removeAyah(ayah.surah.number, ayah.verse.ayah);
    } else {
      await repo.saveAyah(ayah);
    }

    ref.invalidateSelf(); // refresh the list
  }
}
