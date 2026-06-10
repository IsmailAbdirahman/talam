import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talam/features/home/service/tafsir_service.dart';

class TafsirSheet extends ConsumerWidget {
  final int surah;
  final int ayah;
  const TafsirSheet({super.key, required this.surah, required this.ayah});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tafsirId = ref.watch(tafsirLanguageProvider);
    final tafsir = ref.watch(
      tafsirContentProvider((surah: surah, ayah: ayah, tafsirId: tafsirId)),
    );
    final isArabic = tafsirId == 14;

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tafsir Ibn Kathir',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              DropdownButton<int>(
                value: tafsirId,
                underline: const SizedBox.shrink(),
                items: [
                  DropdownMenuItem(
                    value: 169,
                    child: Text(
                      'English',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ),
                  DropdownMenuItem(
                    value: 14,
                    child: Text(
                      'Arabic',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ),
                ],
                onChanged: (value) {
                  if (value != null) {
                    ref
                        .read(tafsirLanguageProvider.notifier)
                        .setLanguage(value);
                  }
                },
              ),
            ],
          ),

          const SizedBox(height: 8),

          Text(
            'Surah $surah, Ayah $ayah',
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),

          const SizedBox(height: 20),

          Expanded(
            child: tafsir.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(
                child: Text(
                  'Could not load tafsir. Try again later.',
                  style: GoogleFonts.poppins(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
              ),
              data: (text) => SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Text(
                  text,
                  textDirection: isArabic
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                  textAlign: isArabic ? TextAlign.right : TextAlign.left,
                  style: GoogleFonts.poppins(
                    fontSize: isArabic ? 16 : 14,
                    height: 1.7,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
