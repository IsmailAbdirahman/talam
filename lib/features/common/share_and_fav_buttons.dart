import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talam/features/fav/presentation/providers/fav_controller.dart';
import 'package:talam/features/home/domain/quran_ayah.dart';
import 'package:talam/features/common/tafsir_sheet.dart';

class ShareAndFavButtons extends ConsumerWidget {
  final QuranAyah quranAyah;
  final VoidCallback? onSharePressed;

  const ShareAndFavButtons({
    super.key,
    required this.quranAyah,
    this.onSharePressed,
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Share button
        IconButton(
          icon: const Icon(Icons.save_alt_rounded),
          onPressed: onSharePressed,
        ),

        // Tafsir button
        IconButton(
          icon: const Icon(Icons.menu_book_rounded),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (context) => SizedBox(
                height: MediaQuery.of(context).size.height * 0.85,
                child: TafsirSheet(
                  surah: quranAyah.surah.number,
                  ayah: quranAyah.verse.ayah,
                ),
              ),
            );
          },
        ),

        // Favourite button
        IconButton(
          icon: Icon(
            isFavourite ? Icons.favorite : Icons.favorite_border,
            color: isFavourite
                ? Colors.red
                : Theme.of(context).colorScheme.onSurface,
          ),
          onPressed: () => controller.toggleFavourite(quranAyah),
        ),
      ],
    );
  }
}
