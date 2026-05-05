import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talam/features/common/page_view_widget.dart';
import 'package:talam/features/fav/service/fav_service.dart';

class FavScreen extends ConsumerWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favData = ref.watch(favAyaatProvider);

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 194, 194, 194),
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Color.fromARGB(255, 194, 194, 194),

        //leading: CloseButton(onPressed: () => Navigator.pop(context)),
      ),
      body: favData.when(
        loading: () => Center(child: CircularProgressIndicator()),
        error: (e, _) => Text('Error'),
        data: (list) => PageViewWidget(data: list),
      ),
    );
  }
}
