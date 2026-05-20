import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:talam/features/common/page_view_widget.dart';
import 'package:talam/features/home/presentation/widgets/profile_and_fav.dart';
import 'package:talam/features/home/repository/quran_repositary.dart';
import 'package:talam/features/profile/presentation/screen/profile.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  final _pageController = PageController();
  bool _isRefreshing = false;

  @override
  void initState() {
    super.initState();
    _maybeAskForReview();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _handleRefresh() async {
    setState(() => _isRefreshing = true);

    final repo = ref.read(quranRepositaryProvider);
    await repo.getQuranAyaat(forceRefresh: true);
    ref.invalidate(quranAyaatProvider);

    // Wait for the new data to load and PageView to rebuild
    await Future.delayed(const Duration(milliseconds: 300));

    if (_pageController.hasClients) {
      _pageController.jumpToPage(0);
    }

    setState(() => _isRefreshing = false);
  }

  Future<void> _maybeAskForReview() async {
    final prefs = await SharedPreferences.getInstance();
    final openCount = (prefs.getInt('app_opens') ?? 0) + 1;
    await prefs.setInt('app_opens', openCount);

    if (openCount == 5) {
      final inAppReview = InAppReview.instance;
      if (await inAppReview.isAvailable()) {
        inAppReview.requestReview();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(quranAyaatProvider);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,

      body: Stack(
        children: [
          data.when(
            loading: () => _ShimmerCard(),
            error: (e, _) => Center(child: Text('Error: $e')),
            data: (list) =>
                PageViewWidget(data: list, controller: _pageController),
          ),

          // Refresh button
          Positioned(
            top: 50,
            right: 20,
            child: GestureDetector(
              onTap: _isRefreshing ? null : _handleRefresh,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: _isRefreshing
                    ? SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      )
                    : Icon(
                        Icons.refresh_rounded,
                        color: Theme.of(context).colorScheme.onSurface,
                        size: 20,
                      ),
              ),
            ),
          ),

          // Profile button
          Positioned(
            bottom: 40,
            right: 45,
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  builder: (context) => ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.9,
                      child: const ProfileScreen(),
                    ),
                  ),
                );
              },
              child: const ProfileAndFav(),
            ),
          ),
        ],
      ),
    );
  }
}

class _ShimmerCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final base = Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.1);
    final highlight = Theme.of(
      context,
    ).colorScheme.onSurface.withValues(alpha: 0.2);

    return Container(
      color: Theme.of(context).colorScheme.surface,
      padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 60),
      child: Shimmer.fromColors(
        baseColor: base,
        highlightColor: highlight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Surah name placeholder
            Container(height: 14, width: 100, color: base),
            const SizedBox(height: 40),

            // Arabic text placeholders (3 lines, right aligned)
            Align(
              alignment: Alignment.centerRight,
              child: Container(height: 24, width: double.infinity, color: base),
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: Container(height: 24, width: 250, color: base),
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: Container(height: 24, width: 180, color: base),
            ),

            const SizedBox(height: 30),

            // Translation placeholders (3 lines)
            Container(height: 16, width: double.infinity, color: base),
            const SizedBox(height: 8),
            Container(height: 16, width: double.infinity, color: base),
            const SizedBox(height: 8),
            Container(height: 16, width: 200, color: base),

            const SizedBox(height: 35),

            // Reference placeholder
            Center(child: Container(height: 14, width: 60, color: base)),

            const SizedBox(height: 40),

            // Buttons row placeholder
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(height: 40, width: 40, color: base),
                const SizedBox(width: 16),
                Container(height: 40, width: 40, color: base),
                const SizedBox(width: 16),
                Container(height: 40, width: 40, color: base),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
