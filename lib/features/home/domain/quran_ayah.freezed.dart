// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quran_ayah.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuranSurah implements DiagnosticableTreeMixin {

 int get number;@JsonKey(name: 'name_arabic') String get nameArabic;@JsonKey(name: 'name_english') String get nameEnglish;@JsonKey(name: 'name_translation') String get nameTranslation;
/// Create a copy of QuranSurah
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuranSurahCopyWith<QuranSurah> get copyWith => _$QuranSurahCopyWithImpl<QuranSurah>(this as QuranSurah, _$identity);

  /// Serializes this QuranSurah to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'QuranSurah'))
    ..add(DiagnosticsProperty('number', number))..add(DiagnosticsProperty('nameArabic', nameArabic))..add(DiagnosticsProperty('nameEnglish', nameEnglish))..add(DiagnosticsProperty('nameTranslation', nameTranslation));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuranSurah&&(identical(other.number, number) || other.number == number)&&(identical(other.nameArabic, nameArabic) || other.nameArabic == nameArabic)&&(identical(other.nameEnglish, nameEnglish) || other.nameEnglish == nameEnglish)&&(identical(other.nameTranslation, nameTranslation) || other.nameTranslation == nameTranslation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,number,nameArabic,nameEnglish,nameTranslation);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'QuranSurah(number: $number, nameArabic: $nameArabic, nameEnglish: $nameEnglish, nameTranslation: $nameTranslation)';
}


}

/// @nodoc
abstract mixin class $QuranSurahCopyWith<$Res>  {
  factory $QuranSurahCopyWith(QuranSurah value, $Res Function(QuranSurah) _then) = _$QuranSurahCopyWithImpl;
@useResult
$Res call({
 int number,@JsonKey(name: 'name_arabic') String nameArabic,@JsonKey(name: 'name_english') String nameEnglish,@JsonKey(name: 'name_translation') String nameTranslation
});




}
/// @nodoc
class _$QuranSurahCopyWithImpl<$Res>
    implements $QuranSurahCopyWith<$Res> {
  _$QuranSurahCopyWithImpl(this._self, this._then);

  final QuranSurah _self;
  final $Res Function(QuranSurah) _then;

/// Create a copy of QuranSurah
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? number = null,Object? nameArabic = null,Object? nameEnglish = null,Object? nameTranslation = null,}) {
  return _then(_self.copyWith(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,nameArabic: null == nameArabic ? _self.nameArabic : nameArabic // ignore: cast_nullable_to_non_nullable
as String,nameEnglish: null == nameEnglish ? _self.nameEnglish : nameEnglish // ignore: cast_nullable_to_non_nullable
as String,nameTranslation: null == nameTranslation ? _self.nameTranslation : nameTranslation // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [QuranSurah].
extension QuranSurahPatterns on QuranSurah {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuranSurah value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuranSurah() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuranSurah value)  $default,){
final _that = this;
switch (_that) {
case _QuranSurah():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuranSurah value)?  $default,){
final _that = this;
switch (_that) {
case _QuranSurah() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int number, @JsonKey(name: 'name_arabic')  String nameArabic, @JsonKey(name: 'name_english')  String nameEnglish, @JsonKey(name: 'name_translation')  String nameTranslation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuranSurah() when $default != null:
return $default(_that.number,_that.nameArabic,_that.nameEnglish,_that.nameTranslation);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int number, @JsonKey(name: 'name_arabic')  String nameArabic, @JsonKey(name: 'name_english')  String nameEnglish, @JsonKey(name: 'name_translation')  String nameTranslation)  $default,) {final _that = this;
switch (_that) {
case _QuranSurah():
return $default(_that.number,_that.nameArabic,_that.nameEnglish,_that.nameTranslation);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int number, @JsonKey(name: 'name_arabic')  String nameArabic, @JsonKey(name: 'name_english')  String nameEnglish, @JsonKey(name: 'name_translation')  String nameTranslation)?  $default,) {final _that = this;
switch (_that) {
case _QuranSurah() when $default != null:
return $default(_that.number,_that.nameArabic,_that.nameEnglish,_that.nameTranslation);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuranSurah with DiagnosticableTreeMixin implements QuranSurah {
  const _QuranSurah({required this.number, @JsonKey(name: 'name_arabic') required this.nameArabic, @JsonKey(name: 'name_english') required this.nameEnglish, @JsonKey(name: 'name_translation') required this.nameTranslation});
  factory _QuranSurah.fromJson(Map<String, dynamic> json) => _$QuranSurahFromJson(json);

@override final  int number;
@override@JsonKey(name: 'name_arabic') final  String nameArabic;
@override@JsonKey(name: 'name_english') final  String nameEnglish;
@override@JsonKey(name: 'name_translation') final  String nameTranslation;

/// Create a copy of QuranSurah
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuranSurahCopyWith<_QuranSurah> get copyWith => __$QuranSurahCopyWithImpl<_QuranSurah>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuranSurahToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'QuranSurah'))
    ..add(DiagnosticsProperty('number', number))..add(DiagnosticsProperty('nameArabic', nameArabic))..add(DiagnosticsProperty('nameEnglish', nameEnglish))..add(DiagnosticsProperty('nameTranslation', nameTranslation));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuranSurah&&(identical(other.number, number) || other.number == number)&&(identical(other.nameArabic, nameArabic) || other.nameArabic == nameArabic)&&(identical(other.nameEnglish, nameEnglish) || other.nameEnglish == nameEnglish)&&(identical(other.nameTranslation, nameTranslation) || other.nameTranslation == nameTranslation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,number,nameArabic,nameEnglish,nameTranslation);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'QuranSurah(number: $number, nameArabic: $nameArabic, nameEnglish: $nameEnglish, nameTranslation: $nameTranslation)';
}


}

/// @nodoc
abstract mixin class _$QuranSurahCopyWith<$Res> implements $QuranSurahCopyWith<$Res> {
  factory _$QuranSurahCopyWith(_QuranSurah value, $Res Function(_QuranSurah) _then) = __$QuranSurahCopyWithImpl;
@override @useResult
$Res call({
 int number,@JsonKey(name: 'name_arabic') String nameArabic,@JsonKey(name: 'name_english') String nameEnglish,@JsonKey(name: 'name_translation') String nameTranslation
});




}
/// @nodoc
class __$QuranSurahCopyWithImpl<$Res>
    implements _$QuranSurahCopyWith<$Res> {
  __$QuranSurahCopyWithImpl(this._self, this._then);

  final _QuranSurah _self;
  final $Res Function(_QuranSurah) _then;

/// Create a copy of QuranSurah
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? number = null,Object? nameArabic = null,Object? nameEnglish = null,Object? nameTranslation = null,}) {
  return _then(_QuranSurah(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,nameArabic: null == nameArabic ? _self.nameArabic : nameArabic // ignore: cast_nullable_to_non_nullable
as String,nameEnglish: null == nameEnglish ? _self.nameEnglish : nameEnglish // ignore: cast_nullable_to_non_nullable
as String,nameTranslation: null == nameTranslation ? _self.nameTranslation : nameTranslation // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$QuranVerse implements DiagnosticableTreeMixin {

@JsonKey(name: 'verse_key') String get verseKey; int get ayah; String get arabic; String get transliteration;@JsonKey(name: 'translations', fromJson: _translationsFromJson) Map<String, String> get translations;
/// Create a copy of QuranVerse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuranVerseCopyWith<QuranVerse> get copyWith => _$QuranVerseCopyWithImpl<QuranVerse>(this as QuranVerse, _$identity);

  /// Serializes this QuranVerse to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'QuranVerse'))
    ..add(DiagnosticsProperty('verseKey', verseKey))..add(DiagnosticsProperty('ayah', ayah))..add(DiagnosticsProperty('arabic', arabic))..add(DiagnosticsProperty('transliteration', transliteration))..add(DiagnosticsProperty('translations', translations));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuranVerse&&(identical(other.verseKey, verseKey) || other.verseKey == verseKey)&&(identical(other.ayah, ayah) || other.ayah == ayah)&&(identical(other.arabic, arabic) || other.arabic == arabic)&&(identical(other.transliteration, transliteration) || other.transliteration == transliteration)&&const DeepCollectionEquality().equals(other.translations, translations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,verseKey,ayah,arabic,transliteration,const DeepCollectionEquality().hash(translations));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'QuranVerse(verseKey: $verseKey, ayah: $ayah, arabic: $arabic, transliteration: $transliteration, translations: $translations)';
}


}

/// @nodoc
abstract mixin class $QuranVerseCopyWith<$Res>  {
  factory $QuranVerseCopyWith(QuranVerse value, $Res Function(QuranVerse) _then) = _$QuranVerseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'verse_key') String verseKey, int ayah, String arabic, String transliteration,@JsonKey(name: 'translations', fromJson: _translationsFromJson) Map<String, String> translations
});




}
/// @nodoc
class _$QuranVerseCopyWithImpl<$Res>
    implements $QuranVerseCopyWith<$Res> {
  _$QuranVerseCopyWithImpl(this._self, this._then);

  final QuranVerse _self;
  final $Res Function(QuranVerse) _then;

/// Create a copy of QuranVerse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? verseKey = null,Object? ayah = null,Object? arabic = null,Object? transliteration = null,Object? translations = null,}) {
  return _then(_self.copyWith(
verseKey: null == verseKey ? _self.verseKey : verseKey // ignore: cast_nullable_to_non_nullable
as String,ayah: null == ayah ? _self.ayah : ayah // ignore: cast_nullable_to_non_nullable
as int,arabic: null == arabic ? _self.arabic : arabic // ignore: cast_nullable_to_non_nullable
as String,transliteration: null == transliteration ? _self.transliteration : transliteration // ignore: cast_nullable_to_non_nullable
as String,translations: null == translations ? _self.translations : translations // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}

}


/// Adds pattern-matching-related methods to [QuranVerse].
extension QuranVersePatterns on QuranVerse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuranVerse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuranVerse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuranVerse value)  $default,){
final _that = this;
switch (_that) {
case _QuranVerse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuranVerse value)?  $default,){
final _that = this;
switch (_that) {
case _QuranVerse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'verse_key')  String verseKey,  int ayah,  String arabic,  String transliteration, @JsonKey(name: 'translations', fromJson: _translationsFromJson)  Map<String, String> translations)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuranVerse() when $default != null:
return $default(_that.verseKey,_that.ayah,_that.arabic,_that.transliteration,_that.translations);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'verse_key')  String verseKey,  int ayah,  String arabic,  String transliteration, @JsonKey(name: 'translations', fromJson: _translationsFromJson)  Map<String, String> translations)  $default,) {final _that = this;
switch (_that) {
case _QuranVerse():
return $default(_that.verseKey,_that.ayah,_that.arabic,_that.transliteration,_that.translations);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'verse_key')  String verseKey,  int ayah,  String arabic,  String transliteration, @JsonKey(name: 'translations', fromJson: _translationsFromJson)  Map<String, String> translations)?  $default,) {final _that = this;
switch (_that) {
case _QuranVerse() when $default != null:
return $default(_that.verseKey,_that.ayah,_that.arabic,_that.transliteration,_that.translations);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuranVerse with DiagnosticableTreeMixin implements QuranVerse {
  const _QuranVerse({@JsonKey(name: 'verse_key') required this.verseKey, required this.ayah, required this.arabic, required this.transliteration, @JsonKey(name: 'translations', fromJson: _translationsFromJson) required final  Map<String, String> translations}): _translations = translations;
  factory _QuranVerse.fromJson(Map<String, dynamic> json) => _$QuranVerseFromJson(json);

@override@JsonKey(name: 'verse_key') final  String verseKey;
@override final  int ayah;
@override final  String arabic;
@override final  String transliteration;
 final  Map<String, String> _translations;
@override@JsonKey(name: 'translations', fromJson: _translationsFromJson) Map<String, String> get translations {
  if (_translations is EqualUnmodifiableMapView) return _translations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_translations);
}


/// Create a copy of QuranVerse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuranVerseCopyWith<_QuranVerse> get copyWith => __$QuranVerseCopyWithImpl<_QuranVerse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuranVerseToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'QuranVerse'))
    ..add(DiagnosticsProperty('verseKey', verseKey))..add(DiagnosticsProperty('ayah', ayah))..add(DiagnosticsProperty('arabic', arabic))..add(DiagnosticsProperty('transliteration', transliteration))..add(DiagnosticsProperty('translations', translations));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuranVerse&&(identical(other.verseKey, verseKey) || other.verseKey == verseKey)&&(identical(other.ayah, ayah) || other.ayah == ayah)&&(identical(other.arabic, arabic) || other.arabic == arabic)&&(identical(other.transliteration, transliteration) || other.transliteration == transliteration)&&const DeepCollectionEquality().equals(other._translations, _translations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,verseKey,ayah,arabic,transliteration,const DeepCollectionEquality().hash(_translations));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'QuranVerse(verseKey: $verseKey, ayah: $ayah, arabic: $arabic, transliteration: $transliteration, translations: $translations)';
}


}

/// @nodoc
abstract mixin class _$QuranVerseCopyWith<$Res> implements $QuranVerseCopyWith<$Res> {
  factory _$QuranVerseCopyWith(_QuranVerse value, $Res Function(_QuranVerse) _then) = __$QuranVerseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'verse_key') String verseKey, int ayah, String arabic, String transliteration,@JsonKey(name: 'translations', fromJson: _translationsFromJson) Map<String, String> translations
});




}
/// @nodoc
class __$QuranVerseCopyWithImpl<$Res>
    implements _$QuranVerseCopyWith<$Res> {
  __$QuranVerseCopyWithImpl(this._self, this._then);

  final _QuranVerse _self;
  final $Res Function(_QuranVerse) _then;

/// Create a copy of QuranVerse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? verseKey = null,Object? ayah = null,Object? arabic = null,Object? transliteration = null,Object? translations = null,}) {
  return _then(_QuranVerse(
verseKey: null == verseKey ? _self.verseKey : verseKey // ignore: cast_nullable_to_non_nullable
as String,ayah: null == ayah ? _self.ayah : ayah // ignore: cast_nullable_to_non_nullable
as int,arabic: null == arabic ? _self.arabic : arabic // ignore: cast_nullable_to_non_nullable
as String,transliteration: null == transliteration ? _self.transliteration : transliteration // ignore: cast_nullable_to_non_nullable
as String,translations: null == translations ? _self._translations : translations // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}


}


/// @nodoc
mixin _$QuranAyah implements DiagnosticableTreeMixin {

 QuranSurah get surah; QuranVerse get verse;
/// Create a copy of QuranAyah
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuranAyahCopyWith<QuranAyah> get copyWith => _$QuranAyahCopyWithImpl<QuranAyah>(this as QuranAyah, _$identity);

  /// Serializes this QuranAyah to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'QuranAyah'))
    ..add(DiagnosticsProperty('surah', surah))..add(DiagnosticsProperty('verse', verse));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuranAyah&&(identical(other.surah, surah) || other.surah == surah)&&(identical(other.verse, verse) || other.verse == verse));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,surah,verse);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'QuranAyah(surah: $surah, verse: $verse)';
}


}

/// @nodoc
abstract mixin class $QuranAyahCopyWith<$Res>  {
  factory $QuranAyahCopyWith(QuranAyah value, $Res Function(QuranAyah) _then) = _$QuranAyahCopyWithImpl;
@useResult
$Res call({
 QuranSurah surah, QuranVerse verse
});


$QuranSurahCopyWith<$Res> get surah;$QuranVerseCopyWith<$Res> get verse;

}
/// @nodoc
class _$QuranAyahCopyWithImpl<$Res>
    implements $QuranAyahCopyWith<$Res> {
  _$QuranAyahCopyWithImpl(this._self, this._then);

  final QuranAyah _self;
  final $Res Function(QuranAyah) _then;

/// Create a copy of QuranAyah
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? surah = null,Object? verse = null,}) {
  return _then(_self.copyWith(
surah: null == surah ? _self.surah : surah // ignore: cast_nullable_to_non_nullable
as QuranSurah,verse: null == verse ? _self.verse : verse // ignore: cast_nullable_to_non_nullable
as QuranVerse,
  ));
}
/// Create a copy of QuranAyah
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuranSurahCopyWith<$Res> get surah {
  
  return $QuranSurahCopyWith<$Res>(_self.surah, (value) {
    return _then(_self.copyWith(surah: value));
  });
}/// Create a copy of QuranAyah
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuranVerseCopyWith<$Res> get verse {
  
  return $QuranVerseCopyWith<$Res>(_self.verse, (value) {
    return _then(_self.copyWith(verse: value));
  });
}
}


/// Adds pattern-matching-related methods to [QuranAyah].
extension QuranAyahPatterns on QuranAyah {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuranAyah value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuranAyah() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuranAyah value)  $default,){
final _that = this;
switch (_that) {
case _QuranAyah():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuranAyah value)?  $default,){
final _that = this;
switch (_that) {
case _QuranAyah() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( QuranSurah surah,  QuranVerse verse)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuranAyah() when $default != null:
return $default(_that.surah,_that.verse);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( QuranSurah surah,  QuranVerse verse)  $default,) {final _that = this;
switch (_that) {
case _QuranAyah():
return $default(_that.surah,_that.verse);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( QuranSurah surah,  QuranVerse verse)?  $default,) {final _that = this;
switch (_that) {
case _QuranAyah() when $default != null:
return $default(_that.surah,_that.verse);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuranAyah with DiagnosticableTreeMixin implements QuranAyah {
  const _QuranAyah({required this.surah, required this.verse});
  factory _QuranAyah.fromJson(Map<String, dynamic> json) => _$QuranAyahFromJson(json);

@override final  QuranSurah surah;
@override final  QuranVerse verse;

/// Create a copy of QuranAyah
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuranAyahCopyWith<_QuranAyah> get copyWith => __$QuranAyahCopyWithImpl<_QuranAyah>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuranAyahToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'QuranAyah'))
    ..add(DiagnosticsProperty('surah', surah))..add(DiagnosticsProperty('verse', verse));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuranAyah&&(identical(other.surah, surah) || other.surah == surah)&&(identical(other.verse, verse) || other.verse == verse));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,surah,verse);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'QuranAyah(surah: $surah, verse: $verse)';
}


}

/// @nodoc
abstract mixin class _$QuranAyahCopyWith<$Res> implements $QuranAyahCopyWith<$Res> {
  factory _$QuranAyahCopyWith(_QuranAyah value, $Res Function(_QuranAyah) _then) = __$QuranAyahCopyWithImpl;
@override @useResult
$Res call({
 QuranSurah surah, QuranVerse verse
});


@override $QuranSurahCopyWith<$Res> get surah;@override $QuranVerseCopyWith<$Res> get verse;

}
/// @nodoc
class __$QuranAyahCopyWithImpl<$Res>
    implements _$QuranAyahCopyWith<$Res> {
  __$QuranAyahCopyWithImpl(this._self, this._then);

  final _QuranAyah _self;
  final $Res Function(_QuranAyah) _then;

/// Create a copy of QuranAyah
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? surah = null,Object? verse = null,}) {
  return _then(_QuranAyah(
surah: null == surah ? _self.surah : surah // ignore: cast_nullable_to_non_nullable
as QuranSurah,verse: null == verse ? _self.verse : verse // ignore: cast_nullable_to_non_nullable
as QuranVerse,
  ));
}

/// Create a copy of QuranAyah
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuranSurahCopyWith<$Res> get surah {
  
  return $QuranSurahCopyWith<$Res>(_self.surah, (value) {
    return _then(_self.copyWith(surah: value));
  });
}/// Create a copy of QuranAyah
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuranVerseCopyWith<$Res> get verse {
  
  return $QuranVerseCopyWith<$Res>(_self.verse, (value) {
    return _then(_self.copyWith(verse: value));
  });
}
}

// dart format on
