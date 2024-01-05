import 'package:movies_app/app/types/movie.dart';
import 'package:movies_app/core/models/movie_detail/movie_detail.dart';
import 'package:movies_app/core/models/movie_list_paginate/movie_list_paginate.dart';

abstract class MovieInterface {
  Future<MovieListPaginate> get({
    required MovieList movieList,
    required int page,
    required String language,
  });

  Future<MovieListPaginate> search({
    required String query,
    required int page,
    required bool includeAdult,
    required String language,
  });

  Future<MovieDetail> detail({
    required int id,
    required String language,
  });

}
