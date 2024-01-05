import 'package:movies_app/app/types/languaje.dart';
import 'package:movies_app/app/types/movie.dart';
import 'package:movies_app/core/models/movie_detail/movie_detail.dart';
import 'package:movies_app/core/models/movie_list_paginate/movie_list_paginate.dart';

abstract class MovieInterface {
  Future<MovieListPaginate> get({
    required MovieType movieType,
    required int page,
    required Language language,
  });

  Future<MovieListPaginate> search({
    required String query,
    required int page,
    required bool includeAdult,
    required Language language,
  });

  Future<MovieDetail> detail({
    required int id,
    required Language language,
  });

}
