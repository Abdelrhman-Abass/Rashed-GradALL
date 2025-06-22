enum Theme {
  dark,
  light,
}

extension ThemeEx on Theme {
  String get value => switch(this){
    Theme.dark => 'Dark',
    Theme.light => 'Light',
  };

  static Theme fromString(String? st) => switch(st){
    'light' => Theme.light,
    'dark' => Theme.dark,
    String() => Theme.dark,
    null => Theme.dark,
  };
}