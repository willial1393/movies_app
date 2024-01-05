import 'package:json_annotation/json_annotation.dart';
import 'package:movies_app/core/models/movie_list/movie_list.dart';

part 'movie_list_paginate.g.dart';

@JsonSerializable()
class MovieListPaginate {
  int page;

  @JsonKey(name: 'total_pages')
  int totalPages;

  @JsonKey(name: 'total_results')
  int totalResults;
 List<MovieList> results;

  MovieListPaginate({
    required this.page,
    required this.totalPages,
    required this.totalResults,
    required this.results
  });

  factory MovieListPaginate.fromJson(Map<String, dynamic> json) =>
      _$MovieListPaginateFromJson(json);

  Map<String, dynamic> toJson() => _$MovieListPaginateToJson(this);
}
