// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallpaper_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(wallpaperService)
const wallpaperServiceProvider = WallpaperServiceProvider._();

final class WallpaperServiceProvider
    extends
        $FunctionalProvider<
          WallpaperService,
          WallpaperService,
          WallpaperService
        >
    with $Provider<WallpaperService> {
  const WallpaperServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'wallpaperServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$wallpaperServiceHash();

  @$internal
  @override
  $ProviderElement<WallpaperService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  WallpaperService create(Ref ref) {
    return wallpaperService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WallpaperService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WallpaperService>(value),
    );
  }
}

String _$wallpaperServiceHash() => r'ee5312f4d915f773ea9f6d197a3b7d03d661122c';
