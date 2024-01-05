import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:movies_app/app/types/movie.dart';
import 'package:movies_app/core/models/movie_list/movie_list.dart';

part 'movie_list_state.g.dart';

@CopyWith()
class MovieListState {
  final List<MovieList> nowPlaying;
  final int nowPlayingPage;

  final List<MovieList> popular;
  final int popularPage;

  final List<MovieList> topRated;
  final int topRatedPage;

  final List<MovieList> upcoming;
  final int upcomingPage;

  final bool loading;
  final bool error;

  final MovieType selectedMovieType;

  List<MovieList> get selectedMovies {
    switch (selectedMovieType) {
      case MovieType.nowPlaying:
        return nowPlaying;
      case MovieType.popular:
        return popular;
      case MovieType.topRated:
        return topRated;
      case MovieType.upcoming:
        return upcoming;
    }
  }

  MovieListState({
    this.nowPlaying = const [],
    this.popular = const [],
    this.topRated = const [],
    this.upcoming = const [],
    this.nowPlayingPage = 1,
    this.popularPage = 1,
    this.topRatedPage = 1,
    this.upcomingPage = 1,
    this.loading = false,
    this.error = false,
    this.selectedMovieType = MovieType.nowPlaying,
  });
}
