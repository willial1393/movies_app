// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_list_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MovieListStateCWProxy {
  MovieListState nowPlaying(List<MovieList> nowPlaying);

  MovieListState popular(List<MovieList> popular);

  MovieListState topRated(List<MovieList> topRated);

  MovieListState upcoming(List<MovieList> upcoming);

  MovieListState nowPlayingPage(int nowPlayingPage);

  MovieListState popularPage(int popularPage);

  MovieListState topRatedPage(int topRatedPage);

  MovieListState upcomingPage(int upcomingPage);

  MovieListState loading(bool loading);

  MovieListState error(bool error);

  MovieListState selectedMovieType(MovieType selectedMovieType);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MovieListState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MovieListState(...).copyWith(id: 12, name: "My name")
  /// ````
  MovieListState call({
    List<MovieList>? nowPlaying,
    List<MovieList>? popular,
    List<MovieList>? topRated,
    List<MovieList>? upcoming,
    int? nowPlayingPage,
    int? popularPage,
    int? topRatedPage,
    int? upcomingPage,
    bool? loading,
    bool? error,
    MovieType? selectedMovieType,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMovieListState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMovieListState.copyWith.fieldName(...)`
class _$MovieListStateCWProxyImpl implements _$MovieListStateCWProxy {
  const _$MovieListStateCWProxyImpl(this._value);

  final MovieListState _value;

  @override
  MovieListState nowPlaying(List<MovieList> nowPlaying) =>
      this(nowPlaying: nowPlaying);

  @override
  MovieListState popular(List<MovieList> popular) => this(popular: popular);

  @override
  MovieListState topRated(List<MovieList> topRated) => this(topRated: topRated);

  @override
  MovieListState upcoming(List<MovieList> upcoming) => this(upcoming: upcoming);

  @override
  MovieListState nowPlayingPage(int nowPlayingPage) =>
      this(nowPlayingPage: nowPlayingPage);

  @override
  MovieListState popularPage(int popularPage) => this(popularPage: popularPage);

  @override
  MovieListState topRatedPage(int topRatedPage) =>
      this(topRatedPage: topRatedPage);

  @override
  MovieListState upcomingPage(int upcomingPage) =>
      this(upcomingPage: upcomingPage);

  @override
  MovieListState loading(bool loading) => this(loading: loading);

  @override
  MovieListState error(bool error) => this(error: error);

  @override
  MovieListState selectedMovieType(MovieType selectedMovieType) =>
      this(selectedMovieType: selectedMovieType);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MovieListState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MovieListState(...).copyWith(id: 12, name: "My name")
  /// ````
  MovieListState call({
    Object? nowPlaying = const $CopyWithPlaceholder(),
    Object? popular = const $CopyWithPlaceholder(),
    Object? topRated = const $CopyWithPlaceholder(),
    Object? upcoming = const $CopyWithPlaceholder(),
    Object? nowPlayingPage = const $CopyWithPlaceholder(),
    Object? popularPage = const $CopyWithPlaceholder(),
    Object? topRatedPage = const $CopyWithPlaceholder(),
    Object? upcomingPage = const $CopyWithPlaceholder(),
    Object? loading = const $CopyWithPlaceholder(),
    Object? error = const $CopyWithPlaceholder(),
    Object? selectedMovieType = const $CopyWithPlaceholder(),
  }) {
    return MovieListState(
      nowPlaying:
          nowPlaying == const $CopyWithPlaceholder() || nowPlaying == null
              ? _value.nowPlaying
              // ignore: cast_nullable_to_non_nullable
              : nowPlaying as List<MovieList>,
      popular: popular == const $CopyWithPlaceholder() || popular == null
          ? _value.popular
          // ignore: cast_nullable_to_non_nullable
          : popular as List<MovieList>,
      topRated: topRated == const $CopyWithPlaceholder() || topRated == null
          ? _value.topRated
          // ignore: cast_nullable_to_non_nullable
          : topRated as List<MovieList>,
      upcoming: upcoming == const $CopyWithPlaceholder() || upcoming == null
          ? _value.upcoming
          // ignore: cast_nullable_to_non_nullable
          : upcoming as List<MovieList>,
      nowPlayingPage: nowPlayingPage == const $CopyWithPlaceholder() ||
              nowPlayingPage == null
          ? _value.nowPlayingPage
          // ignore: cast_nullable_to_non_nullable
          : nowPlayingPage as int,
      popularPage:
          popularPage == const $CopyWithPlaceholder() || popularPage == null
              ? _value.popularPage
              // ignore: cast_nullable_to_non_nullable
              : popularPage as int,
      topRatedPage:
          topRatedPage == const $CopyWithPlaceholder() || topRatedPage == null
              ? _value.topRatedPage
              // ignore: cast_nullable_to_non_nullable
              : topRatedPage as int,
      upcomingPage:
          upcomingPage == const $CopyWithPlaceholder() || upcomingPage == null
              ? _value.upcomingPage
              // ignore: cast_nullable_to_non_nullable
              : upcomingPage as int,
      loading: loading == const $CopyWithPlaceholder() || loading == null
          ? _value.loading
          // ignore: cast_nullable_to_non_nullable
          : loading as bool,
      error: error == const $CopyWithPlaceholder() || error == null
          ? _value.error
          // ignore: cast_nullable_to_non_nullable
          : error as bool,
      selectedMovieType: selectedMovieType == const $CopyWithPlaceholder() ||
              selectedMovieType == null
          ? _value.selectedMovieType
          // ignore: cast_nullable_to_non_nullable
          : selectedMovieType as MovieType,
    );
  }
}

extension $MovieListStateCopyWith on MovieListState {
  /// Returns a callable class that can be used as follows: `instanceOfMovieListState.copyWith(...)` or like so:`instanceOfMovieListState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MovieListStateCWProxy get copyWith => _$MovieListStateCWProxyImpl(this);
}
