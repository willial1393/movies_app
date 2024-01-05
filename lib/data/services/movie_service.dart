import 'package:injectable/injectable.dart';
import 'package:movies_app/app/types/language.dart';
import 'package:movies_app/app/types/movie.dart';
import 'package:movies_app/core/interfaces/movie_interface.dart';
import 'package:movies_app/core/models/movie_detail/movie_detail.dart';
import 'package:movies_app/core/models/movie_genre_response/movie_genre_response.dart';
import 'package:movies_app/core/models/movie_list_paginate/movie_list_paginate.dart';
import 'package:movies_app/data/source/tmdb_api.dart';

@Injectable(as: MovieInterface)
class MovieService implements MovieInterface {
  final TmdbApi api;

  MovieService({required this.api});

  @override
  Future<MovieDetail> detail({
    required int id,
    required Language language,
  }) async {
    final res = await api.get(
      '/movie/$id',
      queryParameters: {'language': language.isoCode},
    );
    return MovieDetail.fromJson(res);
  }

  @override
  Future<MovieListPaginate> get({
    required MovieType movieType,
    required int page,
    required Language language,
  }) async {
    final res = await api.get(
      '/movie/${movieType.name}',
      queryParameters: {
        'page': page,
        'language': language.isoCode,
      },
    );
    return MovieListPaginate.fromJson(res);
  }

  @override
  Future<MovieListPaginate> search({
    required String query,
    required int page,
    required bool includeAdult,
    required Language language,
  }) async {
    final res = await api.get(
      '/search/movie',
      queryParameters: {
        'query': query,
        'page': page,
        'include_adult': includeAdult,
        'language': language.isoCode,
      },
    );
    return MovieListPaginate.fromJson(res);
  }

  @override
  Future<MovieGenreResponse> genre({required Language language}) async {
    final res = await api.get(
      '/genre/movie/list',
      queryParameters: {'language': language.isoCode},
    );
    return MovieGenreResponse.fromJson(res);
  }
}
