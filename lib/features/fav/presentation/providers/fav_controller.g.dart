// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fav_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FavouritesController)
const favouritesControllerProvider = FavouritesControllerProvider._();

final class FavouritesControllerProvider
    extends $AsyncNotifierProvider<FavouritesController, List<QuranAyah>> {
  const FavouritesControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'favouritesControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$favouritesControllerHash();

  @$internal
  @override
  FavouritesController create() => FavouritesController();
}

String _$favouritesControllerHash() =>
    r'8fcd2ec6ec7d3ca3bf0b9b85f0aabf376ea6e9ca';

abstract class _$FavouritesController extends $AsyncNotifier<List<QuranAyah>> {
  FutureOr<List<QuranAyah>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<QuranAyah>>, List<QuranAyah>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<QuranAyah>>, List<QuranAyah>>,
              AsyncValue<List<QuranAyah>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
