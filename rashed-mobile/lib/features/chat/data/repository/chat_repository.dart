import 'package:rashed/core/utils/app_toast.dart';
import 'package:rashed/core/utils/data/index.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../history/data/models/chat.dart';
import '../models/message.dart';


class ChatRepository {
  static const String _sessionIdKey = 'session_id';

  static String? get sessionId => AppLocalStorage.getData(key: _sessionIdKey);
  static Future<void> saveSessionId(String sessionId) async {
    await AppLocalStorage.saveData(key: _sessionIdKey, value: sessionId);
  }
  static Future<void> deleteSessionId() async => await AppLocalStorage.removeData(_sessionIdKey);



  static Future<bool> startSession() async {
    try {
      final Response<dynamic> response = await ApiService.postApi(ApiPaths.startSession);

      debugPrint(response.data.toString());

      if(response.statusCode! < 300){
        await saveSessionId(response.data['data']['sessionId']);
        return true;
      } else {
        AppToast.toast(msg: response.data['message']);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return false;
  }

  static Future<List<Message>> getMessages({String? session}) async {
    try {
      if((session ?? sessionId) == null) return [];
      final Response<dynamic> response = await ApiService.getApi(ApiPaths.getMessages(session ?? sessionId!));

      debugPrint(response.data.toString());

      if(response.statusCode! < 300){
        return (response.data['data'] as List?)?.map((e) => Message.fromJson(e)).toList().reversed.toList() ?? [];
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return [];
  }

  static Future<(bool, Message?, DioExceptionType?)> sendMessage(Message messageDto) async {
    try {
      if(sessionId == null) return (false, null, null);
      final Response<dynamic> response = await ApiService.postApi(ApiPaths.sendMessage(sessionId!), body: messageDto.toDto());

      debugPrint(response.data.toString());

      return (response.statusCode == 201, Message.fromJson(response.data['data']['botMessage']), null);
    } on DioException catch (e) {
      if(e.type == DioExceptionType.connectionTimeout) return (false, null, DioExceptionType.connectionTimeout);
    } catch (e) {
      debugPrint(e.toString());
    }
    return (false, null, null);
  }


  static Future<List<Chat>> getHistory() async {
    try {
      final Response<dynamic> response = await ApiService.getApi(ApiPaths.sessions);

      debugPrint(response.statusCode.toString());
      debugPrint(response.data.toString());

      if(response.statusCode! < 300){
        return (response.data['data'] as List?)?.map((e) => Chat.fromJson(e)).toList() ?? [];
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return [];
  }
}
