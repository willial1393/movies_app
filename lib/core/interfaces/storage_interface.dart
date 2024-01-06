import 'package:movies_app/app/types/language.dart';

abstract class StorageInterface {
  Future<Language> getLanguage();

  Future<void> setLanguage(Language language);
}