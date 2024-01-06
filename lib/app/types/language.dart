enum Language {
  en,
  es,
}

extension LanguageExtension on Language {
  String get name {
    switch (this) {
      case Language.en:
        return 'English';
      case Language.es:
        return 'Español';
    }
  }

  String get isoCode {
    switch (this) {
      case Language.en:
        return 'en-US';
      case Language.es:
        return 'es-CO';
    }
  }
}
