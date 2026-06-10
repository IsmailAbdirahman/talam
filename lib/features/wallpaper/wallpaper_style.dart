import 'package:flutter/material.dart';

@immutable
class WallpaperStyle {
  final String name;
  final List<Color> gradient;
  final Color textColor;
  final Color accentColor;

  const WallpaperStyle({
    required this.name,
    required this.gradient,
    required this.textColor,
    required this.accentColor,
  });

  static const midnight = WallpaperStyle(
    name: 'Midnight',
    gradient: [Color(0xFF11133F), Color(0xFF2A2D5E)],
    textColor: Colors.white,
    accentColor: Color(0xFFE8C674),
  );

  static const sunset = WallpaperStyle(
    name: 'Sunset',
    gradient: [Color(0xFFF6B17A), Color(0xFF7B5E57)],
    textColor: Colors.white,
    accentColor: Color(0xFFFFE5C2),
  );

  static const cream = WallpaperStyle(
    name: 'Cream',
    gradient: [Color(0xFFF5E6D3), Color(0xFFE8D5B7)],
    textColor: Color(0xFF3A2E22),
    accentColor: Color(0xFF8B6F47),
  );

  static const ocean = WallpaperStyle(
    name: 'Ocean',
    gradient: [Color(0xFF1A4D5C), Color(0xFF0D2A33)],
    textColor: Colors.white,
    accentColor: Color(0xFFB8D4DA),
  );

  static const all = [midnight, sunset, cream, ocean];
}
