enum MovieList {
  noPlaying,
  popular,
  topRated,
  upcoming
}

extension MovieListExtension on MovieList {
  String get name {
    switch (this) {
      case MovieList.noPlaying:
        return 'no_playing';
      case MovieList.popular:
        return 'popular';
      case MovieList.topRated:
        return 'top_rated';
      case MovieList.upcoming:
        return 'upcoming';
    }
  }
}