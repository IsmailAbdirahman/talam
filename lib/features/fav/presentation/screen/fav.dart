import 'package:flutter/material.dart';
import 'package:talam/features/common/page_view_widget.dart';
import 'package:talam/features/home/domain/quran_ayah.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 194, 194, 194),
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Color.fromARGB(255, 194, 194, 194),

        leading: CloseButton(onPressed: () => Navigator.pop(context)),
      ),
      body: PageViewWidget(data: quranAyahsData),
    );
  }
}
