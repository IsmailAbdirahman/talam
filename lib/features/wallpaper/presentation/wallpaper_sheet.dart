import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gal/gal.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screenshot/screenshot.dart';
import 'package:talam/features/home/domain/quran_ayah.dart';

class WallpaperSheet extends ConsumerStatefulWidget {
  final QuranAyah quranAyah;
  const WallpaperSheet({super.key, required this.quranAyah});

  @override
  ConsumerState<WallpaperSheet> createState() => _WallpaperSheetState();
}

class _WallpaperSheetState extends ConsumerState<WallpaperSheet> {
  int selectedStyle = 0;
  bool isSaving = false;
  final ScreenshotController _screenshotController = ScreenshotController();

  final styles = [
    _WallpaperStyle(
      name: 'Midnight',
      gradient: const [Color(0xFF11133F), Color(0xFF2A2D5E)],
      textColor: Colors.white,
      accentColor: const Color(0xFFE8C674),
    ),
    _WallpaperStyle(
      name: 'Sunset',
      gradient: const [Color(0xFFF6B17A), Color(0xFF7B5E57)],
      textColor: Colors.white,
      accentColor: const Color(0xFFFFE5C2),
    ),
    _WallpaperStyle(
      name: 'Cream',
      gradient: const [Color(0xFFF5E6D3), Color(0xFFE8D5B7)],
      textColor: const Color(0xFF3A2E22),
      accentColor: const Color(0xFF8B6F47),
    ),
    _WallpaperStyle(
      name: 'Ocean',
      gradient: const [Color(0xFF1A4D5C), Color(0xFF0D2A33)],
      textColor: Colors.white,
      accentColor: const Color(0xFFB8D4DA),
    ),
  ];

  Future<void> _saveWallpaper() async {
    setState(() => isSaving = true);

    try {
      final image = await _screenshotController.captureFromWidget(
        _WallpaperCanvas(
          quranAyah: widget.quranAyah,
          style: styles[selectedStyle],
        ),
        pixelRatio: 3.0,
        targetSize: const Size(1290, 2796),
      );

      await Gal.putImageBytes(image, album: 'Talam');

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Saved to Photos'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      Navigator.pop(context);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to save: $e'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    } finally {
      if (mounted) setState(() => isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final style = styles[selectedStyle];

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Drag handle
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              'Save Photo',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              'Pick a style — save to share or use as wallpaper',
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),

            const SizedBox(height: 20),

            // Live preview (capped height)
            Center(
              child: SizedBox(
                height: 320,
                child: AspectRatio(
                  aspectRatio: 9 / 19.5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: _WallpaperCanvas(
                      quranAyah: widget.quranAyah,
                      style: style,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Style picker
            SizedBox(
              height: 60,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: styles.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final s = styles[index];
                  final isSelected = index == selectedStyle;
                  return GestureDetector(
                    onTap: () => setState(() => selectedStyle = index),
                    child: Container(
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: s.gradient,
                        ),
                        border: Border.all(
                          color: isSelected
                              ? Theme.of(context).colorScheme.primary
                              : Colors.transparent,
                          width: 3,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          s.name,
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: s.textColor,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // Save button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isSaving ? null : _saveWallpaper,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 43, 43, 43),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: isSaving
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : Text(
                        'Save to Photos',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WallpaperStyle {
  final String name;
  final List<Color> gradient;
  final Color textColor;
  final Color accentColor;
  _WallpaperStyle({
    required this.name,
    required this.gradient,
    required this.textColor,
    required this.accentColor,
  });
}

// ── The actual wallpaper image (1290×2796 iPhone resolution) ─────────────────
class _WallpaperCanvas extends StatelessWidget {
  final QuranAyah quranAyah;
  final _WallpaperStyle style;
  const _WallpaperCanvas({required this.quranAyah, required this.style});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.cover,
      child: SizedBox(
        width: 1290,
        height: 2796,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: style.gradient,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(120, 320, 120, 220),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Top — surah name
                Column(
                  children: [
                    Text(
                      quranAyah.surah.nameEnglish.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 42,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 12,
                        color: style.accentColor,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Container(
                      height: 1,
                      width: 100,
                      color: style.accentColor.withValues(alpha: 0.5),
                    ),
                  ],
                ),

                // Middle — Arabic + translation
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      quranAyah.verse.arabic,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.amiri(
                        fontSize: 72,
                        fontWeight: FontWeight.w600,
                        color: style.textColor,
                        height: 1.9,
                      ),
                    ),
                    const SizedBox(height: 80),
                    Text(
                      quranAyah.verse.translation,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 38,
                        fontWeight: FontWeight.w300,
                        color: style.textColor.withValues(alpha: 0.85),
                        height: 1.6,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 60),
                    Text(
                      '${quranAyah.surah.number}:${quranAyah.verse.ayah}',
                      style: GoogleFonts.poppins(
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                        color: style.accentColor,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),

                // Bottom — Talam watermark
                // Bottom — Talam branding
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'TALAM APP',
                      style: GoogleFonts.poppins(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 14,
                        color: style.textColor.withValues(alpha: 0.5),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Daily Quran Verses',
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 4,
                        color: style.textColor.withValues(alpha: 0.4),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
