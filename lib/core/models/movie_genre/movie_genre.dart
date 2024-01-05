import 'package:json_annotation/json_annotation.dart';

part 'movie_genre.g.dart';

@JsonSerializable()
class MovieGenre {
  int id;
  String name;

  MovieGenre({required this.id, required this.name});

  factory MovieGenre.fromJson(Map<String, dynamic> json) =>
      _$MovieGenreFromJson(json);

  Map<String, dynamic> toJson() => _$MovieGenreToJson(this);
}
