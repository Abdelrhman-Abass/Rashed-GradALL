import '../../../../../core/utils/data/app_local_storage.dart';

class AuthRepository{
  static const String boardingKey = "boarding";
  static const String accessTokenKey = "access_token";
  static String? get accessToken => _getToken();
  static bool get boarding => _getBoarding() ?? true;

  static Future<void> setToken(String? userToken) async {
    if(userToken == null) return;
    await AppLocalStorage.saveData(key: accessTokenKey, value: userToken);
  }

  static String? _getToken() {
    return AppLocalStorage.getData(key: accessTokenKey);
  }

  static Future<void> removeToken() async {
    await AppLocalStorage.removeData(accessTokenKey);
  }


  static Future<void> setBoarding() async {
    await AppLocalStorage.saveData(key: boardingKey, value: false);
  }

  static bool? _getBoarding() {
    return AppLocalStorage.getData(key: boardingKey);
  }
}