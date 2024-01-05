import 'package:json_annotation/json_annotation.dart';
import 'package:movies_app/core/models/movie_genre/movie_genre.dart';

part 'movie_genre_response.g.dart';

@JsonSerializable()
class MovieGenreResponse {
  List<MovieGenre> genres;

  MovieGenreResponse({required this.genres});

  factory MovieGenreResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieGenreResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieGenreResponseToJson(this);
}
