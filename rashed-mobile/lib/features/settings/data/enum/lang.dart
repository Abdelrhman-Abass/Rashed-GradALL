enum Language {
  en,
  ar,
}

extension LanguageEx on Language {
  String get value => switch(this){
    Language.en => 'English',
    Language.ar => 'Arabic',
  };

  static Language fromString(String? st) => switch(st){
    'ar' => Language.ar,
    'en' => Language.en,
    String() => Language.en,
    null => Language.en,
  };
}