import 'dart:math';

import 'package:flutter/material.dart';

class HomeModel {
  final String category;
  final String arabicText;
  final String translation;
  final String source;
  final String xp;

  HomeModel({
    required this.category,
    required this.arabicText,
    required this.translation,
    required this.source,
    required this.xp,
  });
}

final List<Color> cardColors = [
  Color(0xFF4B4ACF), // purple
  Color(0xFF1A7A5E), // green
  Color(0xFF8B2FC9), // violet
  Color(0xFF1A6A8A), // blue
];
final Random random = Random();

final List<HomeModel> homeData = [
  HomeModel(
    category: 'HADITH OF THE DAY',
    arabicText: 'إِنَّمَا الْأَعْمَالُ بِالنِّيَّاتِ',
    translation:
        'Actions are only by intentions, and every person gets what they intend.',
    source: 'Sahih Bukhari · 1',
    xp: '+10 XP',
  ),
  HomeModel(
    category: 'QURAN VERSE OF THE DAY',
    arabicText: 'وَقُل رَّبِ زِدْنِي عِلْمًا',
    translation: 'And say, "My Lord, increase me in knowledge."',
    source: 'Surah Taha · 114',
    xp: '+15 XP',
  ),

  HomeModel(
    category: 'QURAN VERSE OF THE DAY',
    arabicText: 'وَقُل رَّبِ زِدْنِي عِلْمًا',
    translation: 'And say, "My Lord, increase me in knowledge."',
    source: 'Surah Taha · 114',
    xp: '+15 XP',
  ),

  HomeModel(
    category: 'QURAN VERSE OF THE DAY',
    arabicText: 'وَقُل رَّبِ زِدْنِي عِلْمًا',
    translation: 'And say, "My Lord, increase me in knowledge."',
    source: 'Surah Taha · 114',
    xp: '+15 XP',
  ),
];
