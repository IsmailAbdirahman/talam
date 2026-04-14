import 'package:flutter/material.dart';
import 'package:talam/features/common/page_view_widget.dart';
import 'package:talam/features/home/domain/quran_ayah.dart';
import 'package:talam/features/home/presentation/widgets/profile_and_fav.dart';
import 'package:talam/features/profile/presentation/screen/profile.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageViewWidget(data: quranAyahsData),
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
