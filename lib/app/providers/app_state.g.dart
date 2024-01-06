// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AppStateCWProxy {
  AppState language(Language language);

  AppState includeAdult(bool includeAdult);

  AppState genres(List<MovieGenre> genres);

  AppState error(bool error);

  AppState loading(bool loading);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AppState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AppState(...).copyWith(id: 12, name: "My name")
  /// ````
  AppState call({
    Language? language,
    bool? includeAdult,
    List<MovieGenre>? genres,
    bool? error,
    bool? loading,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAppState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAppState.copyWith.fieldName(...)`
class _$AppStateCWProxyImpl implements _$AppStateCWProxy {
  const _$AppStateCWProxyImpl(this._value);

  final AppState _value;

  @override
  AppState language(Language language) => this(language: language);

  @override
  AppState includeAdult(bool includeAdult) => this(includeAdult: includeAdult);

  @override
  AppState genres(List<MovieGenre> genres) => this(genres: genres);

  @override
  AppState error(bool error) => this(error: error);

  @override
  AppState loading(bool loading) => this(loading: loading);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AppState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AppState(...).copyWith(id: 12, name: "My name")
  /// ````
  AppState call({
    Object? language = const $CopyWithPlaceholder(),
    Object? includeAdult = const $CopyWithPlaceholder(),
    Object? genres = const $CopyWithPlaceholder(),
    Object? error = const $CopyWithPlaceholder(),
    Object? loading = const $CopyWithPlaceholder(),
  }) {
    return AppState(
      language: language == const $CopyWithPlaceholder() || language == null
          ? _value.language
          // ignore: cast_nullable_to_non_nullable
          : language as Language,
      includeAdult:
          includeAdult == const $CopyWithPlaceholder() || includeAdult == null
              ? _value.includeAdult
              // ignore: cast_nullable_to_non_nullable
              : includeAdult as bool,
      genres: genres == const $CopyWithPlaceholder() || genres == null
          ? _value.genres
          // ignore: cast_nullable_to_non_nullable
          : genres as List<MovieGenre>,
      error: error == const $CopyWithPlaceholder() || error == null
          ? _value.error
          // ignore: cast_nullable_to_non_nullable
          : error as bool,
      loading: loading == const $CopyWithPlaceholder() || loading == null
          ? _value.loading
          // ignore: cast_nullable_to_non_nullable
          : loading as bool,
    );
  }
}

extension $AppStateCopyWith on AppState {
  /// Returns a callable class that can be used as follows: `instanceOfAppState.copyWith(...)` or like so:`instanceOfAppState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AppStateCWProxy get copyWith => _$AppStateCWProxyImpl(this);
}
