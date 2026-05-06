import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talam/features/common/background_icon_color.dart';
import 'package:talam/features/fav/repository/fav_repository.dart';
import 'package:talam/features/home/domain/quran_ayah.dart';

class ShareAndFavButtons extends ConsumerWidget {
  final QuranAyah quranAyah;
  const ShareAndFavButtons({super.key, required this.quranAyah});

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
            color: isFavourite ? Colors.red : Colors.grey[700],
          ),
          onPressed: () => controller.toggleFavourite(quranAyah),
        ),
        IconButton(icon: const Icon(Icons.share), onPressed: () {}),
      ],
    );
  }
}
