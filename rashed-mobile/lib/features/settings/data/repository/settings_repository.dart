import 'package:rashed/features/settings/data/enum/lang.dart';

import '../../../../core/utils/data/index.dart';
import '../enum/theme.dart';

class SettingsRepository{
  static const String languageKey = 'language';
  static const String notificationKey = 'notification';
  static const String themeKey = 'theme';

  static Future<bool> saveLang(Language language) async => AppLocalStorage.saveData(key: languageKey, value: language.name);
  static Language get getLang => LanguageEx.fromString(AppLocalStorage.getData(key: languageKey));

  static Future<bool> saveNotification(bool notification) async => AppLocalStorage.saveData(key: notificationKey, value: notification);
  static bool get notification => AppLocalStorage.getData(key: notificationKey)??false;

  static Future<bool> saveTheme(Theme theme) async => AppLocalStorage.saveData(key: themeKey, value: theme.name);
  static Theme get getTheme => ThemeEx.fromString(AppLocalStorage.getData(key: themeKey));

}