// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetail _$MovieDetailFromJson(Map<String, dynamic> json) => MovieDetail(
      adult: json['adult'] as bool,
      backdropPath: json['backdropPath'] as String,
      belongsToCollection: json['belongsToCollection'],
      budget: json['budget'] as int,
      genres: (json['genres'] as List<dynamic>)
          .map((e) => MovieDetailGenre.fromJson(e as Map<String, dynamic>))
          .toList(),
      homepage: json['homepage'] as String,
      id: json['id'] as int,
      imdbId: json['imdbId'] as String,
      originalLanguage: json['originalLanguage'] as String,
      originalTitle: json['originalTitle'] as String,
      overview: json['overview'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      posterPath: json['posterPath'] as String,
      productionCompanies: (json['productionCompanies'] as List<dynamic>)
          .map((e) =>
              MovieDetailProductionCompany.fromJson(e as Map<String, dynamic>))
          .toList(),
      productionCountries: (json['productionCountries'] as List<dynamic>)
          .map((e) =>
              MovieDetailProductionCountry.fromJson(e as Map<String, dynamic>))
          .toList(),
      releaseDate: json['releaseDate'] as String,
      revenue: json['revenue'] as int,
      runtime: json['runtime'] as int,
      spokenLanguages: (json['spokenLanguages'] as List<dynamic>)
          .map((e) =>
              MovieDetailSpokenLanguage.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String,
      tagline: json['tagline'] as String,
      title: json['title'] as String,
      video: json['video'] as bool,
      voteAverage: (json['voteAverage'] as num).toDouble(),
      voteCount: json['voteCount'] as int,
    );

Map<String, dynamic> _$MovieDetailToJson(MovieDetail instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdropPath': instance.backdropPath,
      'belongsToCollection': instance.belongsToCollection,
      'budget': instance.budget,
      'genres': instance.genres,
      'homepage': instance.homepage,
      'id': instance.id,
      'imdbId': instance.imdbId,
      'originalLanguage': instance.originalLanguage,
      'originalTitle': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'posterPath': instance.posterPath,
      'productionCompanies': instance.productionCompanies,
      'productionCountries': instance.productionCountries,
      'releaseDate': instance.releaseDate,
      'revenue': instance.revenue,
      'runtime': instance.runtime,
      'spokenLanguages': instance.spokenLanguages,
      'status': instance.status,
      'tagline': instance.tagline,
      'title': instance.title,
      'video': instance.video,
      'voteAverage': instance.voteAverage,
      'voteCount': instance.voteCount,
    };

MovieDetailGenre _$MovieDetailGenreFromJson(Map<String, dynamic> json) =>
    MovieDetailGenre(
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$MovieDetailGenreToJson(MovieDetailGenre instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

MovieDetailProductionCompany _$MovieDetailProductionCompanyFromJson(
        Map<String, dynamic> json) =>
    MovieDetailProductionCompany(
      id: json['id'] as int,
      logoPath: json['logoPath'] as String,
      name: json['name'] as String,
      originCountry: json['originCountry'] as String,
    );

Map<String, dynamic> _$MovieDetailProductionCompanyToJson(
        MovieDetailProductionCompany instance) =>
    <String, dynamic>{
      'id': instance.id,
      'logoPath': instance.logoPath,
      'name': instance.name,
      'originCountry': instance.originCountry,
    };

MovieDetailProductionCountry _$MovieDetailProductionCountryFromJson(
        Map<String, dynamic> json) =>
    MovieDetailProductionCountry(
      iso31661: json['iso31661'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$MovieDetailProductionCountryToJson(
        MovieDetailProductionCountry instance) =>
    <String, dynamic>{
      'iso31661': instance.iso31661,
      'name': instance.name,
    };

MovieDetailSpokenLanguage _$MovieDetailSpokenLanguageFromJson(
        Map<String, dynamic> json) =>
    MovieDetailSpokenLanguage(
      englishName: json['englishName'] as String,
      iso6391: json['iso6391'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$MovieDetailSpokenLanguageToJson(
        MovieDetailSpokenLanguage instance) =>
    <String, dynamic>{
      'englishName': instance.englishName,
      'iso6391': instance.iso6391,
      'name': instance.name,
    };
