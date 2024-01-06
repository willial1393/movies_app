import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/app/providers/app_state.dart';
import 'package:movies_app/app/types/language.dart';
import 'package:movies_app/core/interfaces/movie_interface.dart';
import 'package:movies_app/core/interfaces/storage_interface.dart';
import 'package:movies_app/injection.dart';

class AppNotifier extends StateNotifier<AppState> {
  final MovieInterface movieService;
  final StorageInterface storage;

  AppNotifier({
    required this.movieService,
    required this.storage,
  }) : super(AppState());

  Future<void> setLanguage(Language language) async {
    await storage.setLanguage(language);
    state = state.copyWith(language: language);
  }

  Future<void> setIncludeAdult(bool includeAdult) async {
    await storage.setIncludeAdult(includeAdult);
    state = state.copyWith(includeAdult: includeAdult);
  }

  Future<void> fetchGenres() async {
    state = state.copyWith(error: false, loading: true);
    try {
      final res = await movieService.genre(language: state.language);
      state = state.copyWith(genres: res.genres);
    } catch (e) {
      state = state.copyWith(error: true);
    } finally {
      state = state.copyWith(loading: false);
    }
  }
}

final appProvider = StateNotifierProvider<AppNotifier, AppState>((ref) {
  return AppNotifier(
    movieService: getIt<MovieInterface>(),
    storage: getIt<StorageInterface>(),
  );
});
