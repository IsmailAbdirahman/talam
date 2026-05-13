import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gal/gal.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:talam/features/common/provider/translation_notifier.dart';
import 'package:talam/features/home/domain/quran_ayah.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ShareSocialMedia extends StatelessWidget {
  final QuranAyah quranAyah;
  ShareSocialMedia({super.key, required this.quranAyah});

  final _screenshotController = ScreenshotController();

  Future<void> _saveToGallery(BuildContext context) async {
    final image = await _screenshotController.capture(pixelRatio: 3.0);
    if (image == null) return;

    final dir = await getTemporaryDirectory();
    final file = File('${dir.path}/talam_ayah.png');
    await file.writeAsBytes(image);

    // Save to Photos
    await Gal.putImage(file.path, album: 'Talam');

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Saved to Photos'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        leading: const CloseButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        child: Column(
          children: [
            // The card itself — wrapped in Screenshot widget
            Expanded(
              child: Center(
                child: Screenshot(
                  controller: _screenshotController,
                  child: _ShareCard(quranAyah: quranAyah),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Share button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 43, 43, 43),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                icon: const Icon(Icons.save_alt_rounded),
                label: Text(
                  'Save Photo',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: () => _saveToGallery(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── The card UI that gets shared as an image ─────────────────────────────────
class _ShareCard extends ConsumerWidget {
  final QuranAyah quranAyah;
  const _ShareCard({required this.quranAyah});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translationKey = ref.watch(translationProvider);

    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 240, 240, 240),
            Color.fromARGB(255, 200, 200, 200),
          ],
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Surah name top
          Text(
            quranAyah.surah.nameEnglish,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.5,
              color: const Color.fromARGB(255, 43, 43, 43),
            ),
          ),

          const SizedBox(height: 40),

          // Divider
          Container(
            height: 1,
            width: 60,
            margin: const EdgeInsets.symmetric(horizontal: 40),
            color: const Color.fromARGB(255, 43, 43, 43).withValues(alpha: 0.3),
          ),

          const SizedBox(height: 40),

          // Arabic text
          Flexible(
            child: Align(
              alignment: Alignment.centerRight,
              child: AutoSizeText(
                quranAyah.verse.arabic,
                textDirection: TextDirection.rtl,
                maxLines: 8,
                minFontSize: 10,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromARGB(255, 43, 43, 43),
                  height: 1.8,
                ),
              ),
            ),
          ),

          const SizedBox(height: 30),

          // Translation
          Flexible(
            child: AutoSizeText(
              quranAyah.verse.translations[translationKey] ?? '',
              textAlign: TextAlign.center,
              maxLines: 10,
              minFontSize: 8,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: const Color.fromARGB(255, 43, 43, 43),
                height: 1.6,
              ),
            ),
          ),

          const SizedBox(height: 40),

          // Reference
          Text(
            "${quranAyah.surah.number} : ${quranAyah.verse.ayah}",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: const Color.fromARGB(255, 43, 43, 43),
            ),
          ),

          const Spacer(),

          // App name at bottom
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              children: [
                Text(
                  'Talam App',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    color: const Color.fromARGB(255, 43, 43, 43),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Daily Quran Verses',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1,
                    color: const Color.fromARGB(
                      255,
                      43,
                      43,
                      43,
                    ).withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
