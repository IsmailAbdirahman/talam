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
    final current = state.value ?? [];

    final isSaved = current.any(
      (a) =>
          a.surah.number == ayah.surah.number &&
          a.verse.ayah == ayah.verse.ayah,
    );

    if (isSaved) {
      // Remove from UI instantly
      state = AsyncData(
        current
            .where(
              (a) =>
                  !(a.surah.number == ayah.surah.number &&
                      a.verse.ayah == ayah.verse.ayah),
            )
            .toList(),
      );
      await repo.removeAyah(ayah.surah.number, ayah.verse.ayah);
    } else {
      // Add to UI instantly
      state = AsyncData([ayah, ...current]);
      await repo.saveAyah(ayah);
    }

    // Also refresh fav screen list
    ref.invalidate(favAyaatProvider);
  }

  bool isFavourite(QuranAyah ayah) {
    final current = state.value ?? [];
    return current.any(
      (a) =>
          a.surah.number == ayah.surah.number &&
          a.verse.ayah == ayah.verse.ayah,
    );
  }
}
