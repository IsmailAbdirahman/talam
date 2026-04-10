import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talam/home/home.dart';
import 'package:talam/home/home_model.dart';

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
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: homeData.length,
        itemBuilder: (context, index) {
          return Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: 45, right: 45),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 194, 194, 194),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      homeData[index].category,
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 43, 43, 43),
                      ),
                    ),
                    SizedBox(height: 75),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextWidget(data: homeData[index].arabicText),
                    ),
                    SizedBox(height: 15),
                    TextWidget(data: homeData[index].translation),
                    SizedBox(height: 35),
                    Text(
                      homeData[index].source,
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
      ),
    );
  }
}
