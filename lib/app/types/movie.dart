enum MovieType {
  nowPlaying,
  popular,
  topRated,
  upcoming
}

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
}