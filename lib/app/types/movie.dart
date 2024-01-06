enum MovieType { nowPlaying, popular, topRated, upcoming }

extension MovieTypeExtension on MovieType {
  String get name {
    switch (this) {
      case MovieType.nowPlaying:
        return 'now_playing';
      case MovieType.popular:
        return 'popular';
      case MovieType.topRated:
        return 'top_rated';
      case MovieType.upcoming:
        return 'upcoming';
    }
  }

  String get humanize {
    switch (this) {
      case MovieType.nowPlaying:
        return 'En cartelera';
      case MovieType.popular:
        return 'Populares';
      case MovieType.topRated:
        return 'Mejor valoradas';
      case MovieType.upcoming:
        return 'Proximamente';
    }
  }
}

extension MoviePathExtension on String {
  String get toMoviePath {
    return 'https://image.tmdb.org/t/p/w500/$this';
  }
}
