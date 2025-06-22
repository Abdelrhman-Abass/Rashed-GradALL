import 'package:rashed/core/utils/app_toast.dart';
import 'package:rashed/core/utils/data/index.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:rashed/features/auth/data/dto/login.dart';
import 'package:rashed/features/chat/data/repository/chat_repository.dart';

import '../dto/register.dart';
import '../dto/update.dart';
import '../models/user.dart';
import 'auth_repository.dart';

class UserRepository {
  static const String _userKey = 'user_key';
  static User? get user => _user ?? _getUser();
  static User? _user;

  static Future<bool> login(LoginDTO loginDto) async {
    try {
      final Response<dynamic> response = await ApiService.postApi(
        ApiPaths.login,
        body: loginDto.toJson(),
        isAuth: false,
      );

      debugPrint(response.data.toString());
      AppToast.toast(msg: response.data['message']);

      if(response.statusCode! < 300){
        await AuthRepository.setToken(response.data['data']['token']);
        await setUser(User.fromJson(response.data['data']['user']));
        return true;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return false;
  }

  static Future<bool> register(RegisterDTO registerRequest) async {
    try {
      final Response<dynamic> response = await ApiService.postApi(
        ApiPaths.register,
        body: registerRequest.toJson(),
        isAuth: false,
      );

      debugPrint(response.data.toString());
      AppToast.toast(msg: response.data['message'] ?? 'Created Successfully');

      if(response.statusCode! < 300) {
        await AuthRepository.setToken(response.data['data']['token']);
        await setUser(User.fromJson(response.data['data']));
        return true;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return false;
  }

  static Future<bool> logout() async {
    try{
      final Response<dynamic> response = await ApiService.postApi(ApiPaths.logout, body: {}, isAuth: false, bodyToken: true);

      if(response.statusCode! < 300){
        removeUser();
        AuthRepository.removeToken();
        ChatRepository.deleteSessionId();
        return true;
      } else {
        AppToast.toast(msg: response.data['message'] ?? 'Cannot Logout');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return false;
  }


  static Future<bool> changePass(ChangePassDTO changePassDto) async {
    try {
      final Response<dynamic> response = await ApiService.postApi(
        ApiPaths.changePass,
        body: changePassDto.toJson(),
      );

      debugPrint(response.data.toString());
      if(response.statusCode! < 300){
        AppToast.toast(msg: response.data['message'] ?? 'Changed Password Successfully');
        return true;
      } else {
        AppToast.toast(msg: response.data['message'] ?? 'Change Password Failed');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return false;
  }



  static Future<void> setUser(User user) async {
    _user = user;
    await AppLocalStorage.saveMap(_userKey, user.toJson());
  }

  static Future<void> removeUser() async {
    _user = null;
    await AppLocalStorage.removeData(_userKey);
  }

  static User? _getUser() {
    final userJson = AppLocalStorage.getMap(_userKey);
    if (userJson != null) {
      _user = User.fromJson(userJson);
    } else {
      _user = null;
    }
    return _user;
  }

}
