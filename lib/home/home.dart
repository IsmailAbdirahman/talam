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
      body: ListView.builder(
        padding: EdgeInsets.all(14),
        itemCount: homeData.length,
        itemBuilder: (context, index) {
          return Container(
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 16),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: getColors(index),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 9.0, right: 9.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextWidget(data: homeData[index].category),
                  SizedBox(height: 15),
                  Align(
                    alignment: .centerRight,
                    child: TextWidget(data: homeData[index].arabicText),
                  ),
                  SizedBox(height: 15),
                  TextWidget(data: homeData[index].translation),
                  SizedBox(height: 15),
                  TextWidget(data: homeData[index].source),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShareAndFavButtons(),
                      TextWidget(data: homeData[index].xp),
                    ],
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
      height: 21,
      width: 21,
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
        fontSize: 11,
        fontWeight: FontWeight.w600,
        color: Colors.white,
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
          widget: Icon(Icons.favorite_border, size: 12, color: Colors.white),
        ),
        SizedBox(width: 60),
        BackgroundIconColor(
          widget: Icon(Icons.share, size: 12, color: Colors.white),
        ),
      ],
    );
  }
}
