import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talam/features/common/page_view_widget.dart';
import 'package:talam/features/fav/repository/fav_repository.dart';

class FavScreen extends ConsumerWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favData = ref.watch(favouritesControllerProvider);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 194, 194, 194),
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: const Color.fromARGB(255, 194, 194, 194),
      ),
      body: favData.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => const Text('Error'),
        data: (list) => list.isEmpty
            ? const Center(child: Text('No favourites yet'))
            : PageViewWidget(data: list),
      ),
    );
  }
}
