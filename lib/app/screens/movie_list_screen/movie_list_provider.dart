import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/app/providers/app_provider.dart';
import 'package:movies_app/app/screens/movie_list_screen/movie_list_state.dart';
import 'package:movies_app/app/types/languaje.dart';
import 'package:movies_app/app/types/movie.dart';
import 'package:movies_app/core/interfaces/movie_interface.dart';
import 'package:movies_app/injection.dart';

class MovieListNotifier extends StateNotifier<MovieListState> {
  final MovieInterface movieService;
  final Language language;
  final bool includeAdult;

  MovieListNotifier({
    required this.movieService,
    required this.language,
    required this.includeAdult,
  }) : super(MovieListState());

  Future<void> getMovies({
    bool refresh = false,
  }) async {
    if (refresh) {
      this.refresh();
    }
    state = state.copyWith(
      loading: true,
      error: false,
    );
    try {
      int page = 0;
      switch (state.selectedMovieType) {
        case MovieType.nowPlaying:
          page = state.nowPlayingPage;
          break;
        case MovieType.popular:
          page = state.popularPage;
          break;
        case MovieType.topRated:
          page = state.topRatedPage;
          break;
        case MovieType.upcoming:
          page = state.upcomingPage;
          break;
      }
      final movies = await movieService.get(
        page: page + 1,
        movieType: state.selectedMovieType,
        language: language,
      );

      switch (state.selectedMovieType) {
        case MovieType.nowPlaying:
          state = state.copyWith(
            nowPlaying: movies.results,
            nowPlayingPage: page + 1,
          );
          break;
        case MovieType.popular:
          state = state.copyWith(
            popular: movies.results,
            popularPage: page + 1,
          );
          break;
        case MovieType.topRated:
          state = state.copyWith(
            topRated: movies.results,
            topRatedPage: page + 1,
          );
          break;
        case MovieType.upcoming:
          state = state.copyWith(
            upcoming: movies.results,
            upcomingPage: page + 1,
          );
          break;
      }
    } catch (e) {
      state = state.copyWith(error: true);
      rethrow;
    } finally {
      state = state.copyWith(loading: false);
    }
  }

  void refresh() {
    switch (state.selectedMovieType) {
      case MovieType.nowPlaying:
        state = state.copyWith(nowPlaying: [], nowPlayingPage: 1);
        break;
      case MovieType.popular:
        state = state.copyWith(popular: [], popularPage: 1);
        break;
      case MovieType.topRated:
        state = state.copyWith(topRated: [], topRatedPage: 1);
        break;
      case MovieType.upcoming:
        state = state.copyWith(upcoming: [], upcomingPage: 1);
        break;
    }
  }
}

final movieListProvider =
    StateNotifierProvider<MovieListNotifier, MovieListState>((ref) {
  return MovieListNotifier(
    movieService: getIt<MovieInterface>(),
    language: ref.watch(appProvider.select((value) => value.language)),
    includeAdult: ref.watch(appProvider.select((value) => value.includeAdult)),
  );
});
