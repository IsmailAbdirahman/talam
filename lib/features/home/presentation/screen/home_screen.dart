import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talam/features/common/page_view_widget.dart';
import 'package:talam/features/home/presentation/widgets/profile_and_fav.dart';
import 'package:talam/features/home/repository/quran_repositary.dart';
import 'package:talam/features/profile/presentation/screen/profile.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(quranAyaatProvider);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 194, 194, 194),

      body: Stack(
        children: [
          data.when(
            loading: () => Center(child: CircularProgressIndicator()),
            error: (e, _) => Text('Error'),
            data: (list) => PageViewWidget(data: list),
          ),

          Positioned(
            bottom: 40,
            right: 45,
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20), // ✅ curves top left and right
                    ),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.9,
                      child: ProfileScreen(),
                    ),
                  ),
                );
              },
              child: ProfileAndFav(),
            ),
          ),
        ],
      ),
    );
  }
}
