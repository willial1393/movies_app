import 'package:movies_app/app/types/language.dart';
import 'package:movies_app/core/models/movie_detail/movie_detail.dart';

abstract class StorageInterface {
  Future<Language> getLanguage();

  Future<void> setLanguage(Language language);

  Future<bool> getIncludeAdult();

  Future<void> setIncludeAdult(bool includeAdult);

  void saveMovie(MovieDetail movie);

  void removeMovie(MovieDetail movie);

  Future<List<MovieDetail>> getSavedMovies();
}
