import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talam/features/home/domain/quran_ayah.dart';
import 'package:talam/features/wallpaper/service/wallpaper_service.dart';
import 'package:talam/features/wallpaper/wallpaper_style.dart';

class WallpaperSheet extends ConsumerStatefulWidget {
  final QuranAyah quranAyah;
  const WallpaperSheet({super.key, required this.quranAyah});

  @override
  ConsumerState<WallpaperSheet> createState() => _WallpaperSheetState();
}

class _WallpaperSheetState extends ConsumerState<WallpaperSheet> {
  int _selectedIndex = 0;
  bool _isSaving = false;

  Future<void> _save() async {
    setState(() => _isSaving = true);
    try {
      final style = WallpaperStyle.all[_selectedIndex];
      await ref.read(wallpaperServiceProvider).captureAndSave(
        WallpaperCanvas(quranAyah: widget.quranAyah, style: style),
      );
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
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final style = WallpaperStyle.all[_selectedIndex];

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

            // Live preview
            Center(
              child: SizedBox(
                height: 320,
                child: AspectRatio(
                  aspectRatio: 9 / 19.5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: WallpaperCanvas(
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
                itemCount: WallpaperStyle.all.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final s = WallpaperStyle.all[index];
                  final isSelected = index == _selectedIndex;
                  return GestureDetector(
                    onTap: () => setState(() => _selectedIndex = index),
                    child: Container(
                      width: 75,
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
                onPressed: _isSaving ? null : _save,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 43, 43, 43),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: _isSaving
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

// The wallpaper image itself — rendered at 1290×2796 for iPhone resolution.
// Used both as the live preview (scaled down via FittedBox) and as the
// off-screen capture target in WallpaperService.
class WallpaperCanvas extends StatelessWidget {
  final QuranAyah quranAyah;
  final WallpaperStyle style;
  const WallpaperCanvas({super.key, required this.quranAyah, required this.style});

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
