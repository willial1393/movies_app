import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/app/providers/app_state.dart';
import 'package:movies_app/app/types/language.dart';

class AppNotifier extends StateNotifier<AppState> {
  AppNotifier() : super(AppState());

  void setLanguage(Language language) {
    state = state.copyWith(language: language);
  }

  void setIncludeAdult(bool includeAdult) {
    state = state.copyWith(includeAdult: includeAdult);
  }
}

final appProvider = StateNotifierProvider<AppNotifier, AppState>((ref) {
  return AppNotifier();
});
