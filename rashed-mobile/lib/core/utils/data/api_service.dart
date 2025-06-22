import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../../../../core/utils/navigator.dart';
import '../../../../core/widgets/app_dialogs.dart';

import '../../../features/auth/data/repositories/auth_repository.dart';
import 'api_path.dart';

class ApiService {
  static const String urlencodedType = 'application/x-www-form-urlencoded';
  static const String jsonType = 'application/json';
  static const String multiPart = "multipart/form-data";
  static const int unauthorizedCode = 403;
  static const int internalServerErrorCode = 500;
  static const String authorizationParameter = 'Authorization';
  static const String bearer = 'Bearer ';


  static Dio dio = Dio(
      BaseOptions(
        baseUrl: ApiPaths.base,
        receiveDataWhenStatusError: true,
        validateStatus: (status) => true,
      )
  );



  /// Post api
  static Future<Response<T>> postApi<T>(
    String path, {
    Map<String, dynamic>? body,
    FormData? formData,
    bool isAuth = true,
    bool bodyToken = false,
  }) async {

    assert(!(body != null && formData != null), "Both 'body' and 'formData' should not be provided at the same time.");

    //call api
    try {
      authorize();


      final Response<T> response = await dio.post(
          path,
          data: body ?? formData,
          options: Options(
              contentType: formData != null ? multiPart : jsonType,
              validateStatus: (int? status) {
                // if (status == 401) return false;
                return true;
              },
          ),
      );
      if(isAuth || bodyToken) isTokenExpired(response);
      return response;
    } on DioException catch (e) {
      debugPrint(e.message);
      throw Exception(e.message);
    }
  }

  /// Get api
  static Future<Response<T>> getApi<T>(String path, {Map<String, dynamic>? params, bool dialog = true}) async {
    // authorize the api
    try {
      authorize();

      final Response<T> response = await dio.get(path, queryParameters: params, options: Options(validateStatus: (int? status) {
        // if (status == 401 || status == 403) return false;
        return true;
      }));
      if(dialog) isTokenExpired(response);
      return response;
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }

  static void authorize({bool isRefresh = false}) {
    final String? token = AuthRepository.accessToken;
    dio.options.headers[authorizationParameter] = token == null ? null : '$bearer$token';
    dio.options.headers['Accept'] = 'application/json';
  }

  static Future<Response<T>> putApi<T>(
    String path, {
    Map<String, dynamic>? body,
    FormData? formData,
    bool isAuth = true,
  }) async {

    assert(!(body != null && formData != null), "Both 'body' and 'formData' should not be provided at the same time.");

    //call api
    if (isAuth) {
      authorize();
    }


    final Response<T> response = await dio.put(path,
        data: body ?? formData,
        options: Options(
            contentType: formData != null ? multiPart : jsonType,
            validateStatus: (int? status) {
              // if (status == 401) return false;
              return true;
            }));
    if(isAuth) isTokenExpired(response);
    return response;
  }

  static Future<Response<T>> patchApi<T>(
      String path, {
        Map<String, dynamic>? body,
        FormData? formData,
        bool isAuth = true,
      }) async {

    assert(!(body != null && formData != null), "Both 'body' and 'formData' should not be provided at the same time.");

    //call api
    try {
      if (isAuth) {
        authorize();
      }


      final Response<T> response = await dio.patch(
        path,
        data: body ?? formData,
        options: Options(
          contentType: formData != null ? multiPart : jsonType,
          validateStatus: (int? status) {
            // if (status == 401) return false;
            return true;
          },
        ),
      );
      if(isAuth) isTokenExpired(response);
      return response;
    } on DioException catch (e) {
      debugPrint(e.message);
      throw Exception(e.message);
    }
  }

  /// Delete api
  static Future<Response<T>> deleteApi<T>(String path, {Map<String, dynamic>? params, bool isAuth = true}) async {
    try {
      if (isAuth) {
        authorize();
      }

      final Response<T> response = await dio.delete(
        path,
        queryParameters: params,
        options: Options(validateStatus: (int? status) {
          return true;
        }),
      );

      if (isAuth) isTokenExpired(response);
      return response;
    } on DioException catch (e) {
      debugPrint(e.message);
      throw Exception(e.message);
    }
  }

  static isTokenExpired<T>(Response response) async {
    if (response.statusCode != unauthorizedCode) return;

    // If refresh fails, show session expired dialog
    await AppDialogs.showErrorDialog(
      navigatorKey.currentContext!,
      error: 'Session Expired',
      okText: 'Login Again',
      canPop: false,
      dismissible: false,
    );

    AuthRepository.removeToken();
  }

}
