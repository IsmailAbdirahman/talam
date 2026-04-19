import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talam/features/common/share_and_fav_buttons.dart';
import 'package:talam/features/common/text_widgets.dart';
import 'package:talam/features/home/domain/quran_ayah.dart';

class PageViewWidget extends StatelessWidget {
  final List<QuranAyah> data;
  const PageViewWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.only(left: 45, right: 45),
          decoration: BoxDecoration(color: Color.fromARGB(255, 194, 194, 194)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    quranAyahsData[index].surah.nameEnglish,
                    style: GoogleFonts.poppins(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(255, 43, 43, 43),
                    ),
                  ),
                  SizedBox(height: 75),
                  Align(
                    alignment: .centerRight,
                    child: TextWidget(data: data[index].verse.arabic),
                  ),
                  SizedBox(height: 15),
                  TextWidget(data: data[index].verse.translation),
                  SizedBox(height: 35),
                  Text(
                    "${data[index].surah.number}:${data[index].verse.ayah}",
                    style: GoogleFonts.poppins(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(255, 43, 43, 43),
                    ),
                  ),
                  SizedBox(height: 75),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [ShareAndFavButtons()],
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
