import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends AsyncNotifier<ThemeMode> {
  static const _key = 'theme_mode';

  @override
  Future<ThemeMode> build() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool(_key) ?? false;
    return isDark ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> toggle() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = state.value == ThemeMode.dark;
    state = AsyncData(isDark ? ThemeMode.light : ThemeMode.dark);
    await prefs.setBool(_key, !isDark);
  }
}

final themeProvider = AsyncNotifierProvider<ThemeNotifier, ThemeMode>(
  ThemeNotifier.new,
);
