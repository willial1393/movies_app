import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:movies_app/app/types/language.dart';
import 'package:movies_app/core/models/movie_genre/movie_genre.dart';

part 'app_state.g.dart';

@CopyWith()
class AppState {
  final Language language;
  final bool includeAdult;
  final List<MovieGenre> genres;

  final bool error;
  final bool loading;

  AppState({
    this.language = Language.es,
    this.includeAdult = false,
    this.genres = const [],
    this.error = false,
    this.loading = false,
  });
}
