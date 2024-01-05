import 'package:injectable/injectable.dart';
import 'package:movies_app/app/types/movie.dart';
import 'package:movies_app/core/interfaces/movie_interface.dart';
import 'package:movies_app/core/models/movie_detail/movie_detail.dart';
import 'package:movies_app/core/models/movie_list_paginate/movie_list_paginate.dart';
import 'package:movies_app/data/source/tmdb_api.dart';

@Injectable(as: MovieInterface)
class MovieService implements MovieInterface {
  final TmdbApi api;

  MovieService({required this.api});

  @override
  Future<MovieDetail> detail({
    required int id,
    required String language,
  }) async {
    final res = await api.get(
      '/movie/$id',
      queryParameters: {'language': language},
    );
    return MovieDetail.fromJson(res);
  }

  @override
  Future<MovieListPaginate> get({
    required MovieList movieList,
    required int page,
    required String language,
  }) async {
    final res = await api.get(
      '/movie/${movieList.name}',
      queryParameters: {
        'page': page,
        'language': language,
      },
    );
    return MovieListPaginate.fromJson(res);
  }

  @override
  Future<MovieListPaginate> search({
    required String query,
    required int page,
    required bool includeAdult,
    required String language,
  }) async {
    final res = await api.get(
      '/search/movie',
      queryParameters: {
        'query': query,
        'page': page,
        'include_adult': includeAdult,
        'language': language,
      },
    );
    return MovieListPaginate.fromJson(res);
  }
}
