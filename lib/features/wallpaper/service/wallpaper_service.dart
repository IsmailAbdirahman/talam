import 'package:flutter/material.dart';
import 'package:gal/gal.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:screenshot/screenshot.dart';

part 'wallpaper_service.g.dart';

@riverpod
WallpaperService wallpaperService(Ref ref) => WallpaperService();

class WallpaperService {
  final _screenshotController = ScreenshotController();

  Future<void> captureAndSave(Widget canvas) async {
    final image = await _screenshotController.captureFromWidget(
      canvas,
      pixelRatio: 3.0,
      targetSize: const Size(1290, 2796),
    );
    await Gal.putImageBytes(image, album: 'Talam');
  }
}
