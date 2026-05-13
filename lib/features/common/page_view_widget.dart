import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talam/features/common/provider/translation_notifier.dart';
import 'package:talam/features/common/share_and_fav_buttons.dart';
import 'package:talam/features/common/text_widgets.dart';
import 'package:talam/features/fav/presentation/widgets/share_social_media.dart';
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
          color: Theme.of(context).colorScheme.surface,
          padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                ayah.surah.nameEnglish,
                style: GoogleFonts.poppins(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 40),

              // Scrollable middle with auto fade if long
              Flexible(
                child: _ScrollWithFade(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextWidget(data: ayah.verse.arabic),
                      ),
                      const SizedBox(height: 20),
                      TextWidget(
                        data:
                            ayah.verse.translations[ref.watch(
                              translationProvider,
                            )] ??
                            '',
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 35),
              Text(
                "${ayah.surah.number}:${ayah.verse.ayah}",
                style: GoogleFonts.poppins(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ShareAndFavButtons(
                    quranAyah: ayah,
                    onSharePressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (context) => ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(24),
                          ),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.9,
                            child: ShareSocialMedia(quranAyah: ayah),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

// Scrollable widget that adds a fade gradient at the bottom only when content
// is taller than its container (i.e. when it actually needs to be scrolled).
class _ScrollWithFade extends StatefulWidget {
  final Widget child;
  const _ScrollWithFade({required this.child});

  @override
  State<_ScrollWithFade> createState() => _ScrollWithFadeState();
}

class _ScrollWithFadeState extends State<_ScrollWithFade> {
  final _controller = ScrollController();
  bool _needsFade = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_controller.hasClients && _controller.position.maxScrollExtent > 0) {
        setState(() => _needsFade = true);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scrollView = SingleChildScrollView(
      controller: _controller,
      physics: const BouncingScrollPhysics(),
      child: widget.child,
    );

    if (!_needsFade) return scrollView;

    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Colors.black, Colors.black, Colors.transparent],
        stops: [0.0, 0.85, 1.0],
      ).createShader(bounds),
      blendMode: BlendMode.dstIn,
      child: scrollView,
    );
  }
}
