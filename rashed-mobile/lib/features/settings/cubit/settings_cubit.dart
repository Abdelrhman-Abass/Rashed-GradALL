import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rashed/core/resources/app_routes.dart';
import 'package:rashed/core/utils/navigator.dart';
import 'package:rashed/features/auth/data/repositories/user_repository.dart';
import 'package:rashed/features/settings/data/repository/settings_repository.dart';

import '../data/enum/lang.dart';
import '../data/enum/theme.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  bool notification = SettingsRepository.notification;
  toggleNotification(bool notify){
    notification = notify;
    SettingsRepository.saveNotification(notify);
    emit(ToggleNotification());
  }

  Language lang = SettingsRepository.getLang;
  toggleLang(){
    lang = lang == Language.en ? Language.ar : Language.en;
    SettingsRepository.saveLang(lang);
    emit(ToggleNotification());
  }

  Theme theme = SettingsRepository.getTheme;
  toggleTheme(){
    theme = theme == Theme.dark ? Theme.light : Theme.dark;
    SettingsRepository.saveTheme(theme);
    emit(ToggleNotification());
  }

  void logout() async {
    emit(LogoutLoading());
    final success = await UserRepository.logout();
    if(success) popAllAndPushName(AppRoutes.login);
    emit(LogoutDone());
  }
}
