import 'package:flutter/material.dart';
import 'package:talam/features/common/background_icon_color.dart';

class ProfileAndFav extends StatelessWidget {
  const ProfileAndFav({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundIconColor(
      widget: Icon(Icons.person, size: 20, color: Colors.black),
    );
  }
}
