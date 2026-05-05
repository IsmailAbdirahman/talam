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

    return Row(
      children: [
        GestureDetector(
          onTap: () {
            controller.toggleFavourite(quranAyah);
          },
          child: BackgroundIconColor(
            widget: Icon(Icons.favorite, size: 20, color: Colors.black),
          ),
        ),
        SizedBox(width: 20),
        GestureDetector(
          onTap: () {
            print("Shared Post");
          },
          child: BackgroundIconColor(
            widget: Icon(
              Icons.arrow_upward_rounded,
              size: 20,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
