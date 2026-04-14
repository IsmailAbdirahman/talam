import 'package:flutter/material.dart';
import 'package:talam/features/common/background_icon_color.dart';

class ShareAndFavButtons extends StatelessWidget {
  const ShareAndFavButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            print("Liked POst");
          },
          child: BackgroundIconColor(
            widget: Icon(Icons.favorite, size: 20, color: Colors.black),
          ),
        ),
        SizedBox(width: 20),
        GestureDetector(
          onTap: () {
            print("Shared Post");
          },
          child: BackgroundIconColor(
            widget: Icon(
              Icons.arrow_upward_rounded,
              size: 20,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
