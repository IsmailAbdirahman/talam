import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talam/features/fav/repository/fav_repository.dart';
import 'package:talam/features/home/domain/quran_ayah.dart';

class ShareAndFavButtons extends ConsumerWidget {
  final QuranAyah quranAyah;
  final VoidCallback onSharePressed;

  const ShareAndFavButtons({
    super.key,
    required this.quranAyah,
    required this.onSharePressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(favouritesControllerProvider.notifier);
    final favsAsync = ref.watch(favouritesControllerProvider);

    final isFavourite = favsAsync.maybeWhen(
      data: (list) => list.any(
        (a) =>
            a.surah.number == quranAyah.surah.number &&
            a.verse.ayah == quranAyah.verse.ayah,
      ),
      orElse: () => false,
    );

    return Row(
      children: [
        IconButton(
          icon: Icon(
            isFavourite ? Icons.favorite : Icons.favorite_border,
            color: isFavourite
                ? Colors.red
                : Theme.of(context).colorScheme.onSurface,
          ),
          onPressed: () => controller.toggleFavourite(quranAyah),
        ),
        IconButton(
          icon: const Icon(Icons.save_alt_rounded),
          onPressed: onSharePressed, // ← uses passed callback
        ),
      ],
    );
  }
}
