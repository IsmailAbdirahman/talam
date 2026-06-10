import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:talam/features/fav/data/fav_repository.dart';
import 'package:talam/features/home/domain/quran_ayah.dart';

part 'fav_controller.g.dart';

@riverpod
class FavouritesController extends _$FavouritesController {
  @override
  Future<List<QuranAyah>> build() async {
    return ref.read(favouritesRepositoryProvider).getFavourites();
  }

  Future<void> toggleFavourite(QuranAyah ayah) async {
    final repo = ref.read(favouritesRepositoryProvider);
    final current = state.value ?? [];

    final isSaved = current.any((a) => a.sameAyah(ayah));

    if (isSaved) {
      state = AsyncData(
        current.where((a) => !a.sameAyah(ayah)).toList(),
      );
      await repo.removeAyah(ayah.surah.number, ayah.verse.ayah);
    } else {
      state = AsyncData([ayah, ...current]);
      await repo.saveAyah(ayah);
    }

    ref.invalidate(favAyaatProvider);
  }

  bool isFavourite(QuranAyah ayah) {
    final current = state.value ?? [];
    return current.any((a) => a.sameAyah(ayah));
  }
}
