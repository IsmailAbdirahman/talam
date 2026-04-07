import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talam/home/home_model.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  Color getColors(int index) {
    List<Color> cardColors = [
      Color(0xFF4B4ACF), // purple
      Color(0xFF1A7A5E), // green
      Color(0xFF8B2FC9), // violet
      Color(0xFF1A6A8A), // blue
    ];
    return cardColors[index % cardColors.length];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: homeData.length,
        itemBuilder: (context, index) {
          return Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(color: getColors(index)),
            child: Padding(
              padding: const EdgeInsets.all(21.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    homeData[index].category,
                    style: GoogleFonts.poppins(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[300],
                    ),
                  ),
                  SizedBox(height: 75),
                  Align(
                    alignment: .centerRight,
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
                      color: Colors.grey[300],
                    ),
                  ),
                  SizedBox(height: 85),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [ShareAndFavButtons()],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class BackgroundIconColor extends StatelessWidget {
  final Widget widget;
  const BackgroundIconColor({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 41,
      width: 41,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white24),
      child: widget,
    );
  }
}

class TextWidget extends StatelessWidget {
  final String data;
  const TextWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: const Color.fromARGB(255, 234, 231, 231),
      ),
    );
  }
}

class ShareAndFavButtons extends StatelessWidget {
  const ShareAndFavButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BackgroundIconColor(
          widget: Icon(Icons.favorite, size: 20, color: Colors.white),
        ),
        SizedBox(width: 20),
        BackgroundIconColor(
          widget: Icon(
            Icons.arrow_upward_rounded,
            size: 20,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
