import 'package:json_annotation/json_annotation.dart';

part 'movie_detail.g.dart';

@JsonSerializable()
class MovieDetail {
  bool adult;
  String backdropPath;
  dynamic belongsToCollection;
  int budget;
  List<MovieDetailGenre> genres;
  String homepage;
  int id;
  String imdbId;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  List<MovieDetailProductionCompany> productionCompanies;
  List<MovieDetailProductionCountry> productionCountries;
  String releaseDate;
  int revenue;
  int runtime;
  List<MovieDetailSpokenLanguage> spokenLanguages;
  String status;
  String tagline;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  MovieDetail({
    required this.adult,
    required this.backdropPath,
    required this.belongsToCollection,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieDetail.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailToJson(this);
}

@JsonSerializable()
class MovieDetailGenre {
  int id;
  String name;

  MovieDetailGenre({
    required this.id,
    required this.name,
  });

  factory MovieDetailGenre.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailGenreFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailGenreToJson(this);
}

@JsonSerializable()
class MovieDetailProductionCompany {
  int id;
  String logoPath;
  String name;
  String originCountry;

  MovieDetailProductionCompany({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  factory MovieDetailProductionCompany.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailProductionCompanyFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailProductionCompanyToJson(this);
}

@JsonSerializable()
class MovieDetailProductionCountry {
  String iso31661;
  String name;

  MovieDetailProductionCountry({
    required this.iso31661,
    required this.name,
  });

  factory MovieDetailProductionCountry.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailProductionCountryFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailProductionCountryToJson(this);
}

@JsonSerializable()
class MovieDetailSpokenLanguage {
  String englishName;
  String iso6391;
  String name;

  MovieDetailSpokenLanguage({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });

  factory MovieDetailSpokenLanguage.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailSpokenLanguageFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailSpokenLanguageToJson(this);
}
