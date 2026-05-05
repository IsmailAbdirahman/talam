import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talam/features/common/share_and_fav_buttons.dart';
import 'package:talam/features/common/text_widgets.dart';
import 'package:talam/features/home/domain/quran_ayah.dart';

class PageViewWidget extends ConsumerWidget {
  final List<QuranAyah> data;
  const PageViewWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: data.length,
      itemBuilder: (context, index) {
        final ayah = data[index];

        return Container(
          color: const Color.fromARGB(255, 194, 194, 194),
          child: CustomScrollView(
            // BouncingScrollPhysics makes it feel smooth on both iOS and Android
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverFillRemaining(
                hasScrollBody:
                    false, // Essential for centering + scrolling logic
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 45,
                    vertical: 30,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // 1. Surah Name
                      Text(
                        ayah.surah.nameEnglish,
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 43, 43, 43),
                        ),
                      ),

                      const SizedBox(height: 60),

                      // 2. Arabic Text
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextWidget(data: ayah.verse.arabic),
                      ),

                      const SizedBox(height: 20),

                      // 3. Translation Text
                      TextWidget(data: ayah.verse.translation),

                      const SizedBox(height: 35),

                      // 4. Reference (Surah:Ayah)
                      Text(
                        "${ayah.surah.number}:${ayah.verse.ayah}",
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 43, 43, 43),
                        ),
                      ),

                      // This pushes the buttons to the bottom of the screen if
                      // there is extra space, but disappears if the text is long.
                      const Spacer(),

                      const SizedBox(height: 40),

                      // 5. Action Buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [ShareAndFavButtons(quranAyah: ayah)],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
