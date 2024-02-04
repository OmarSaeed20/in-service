// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '/index.dart';
part 'interceptor_action.dart';

class DioFactory {
  AppPreferences pref;
  late Dio dio;
  DioFactory(this.pref) {
    // CancelToken cancelToken = CancelToken();
    BaseOptions options = BaseOptions(
      baseUrl: EndPoints.baseUrl,
      headers: {"Accept": "application/json"},
      contentType: 'application/json',
      responseType: ResponseType.json,
    );

    dio = Dio(options);

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    if (kDebugMode) {
      dio.interceptors.add(
        LogInterceptor(
          // logPrint: (object) => //debugPrint(object.toString()),
          error: true,
          request: true,
          requestBody: true,
          responseBody: true,
          requestHeader: true,
          responseHeader: true,
        ),
      );
    }

    dio.interceptors.add(
      // RefreshTokenInterceptor(pref, dioClient: dio)
      InterceptorsWrapper(
        onRequest: (options, handler) => handler.next(options),
        onResponse: (response, handler) => handler.next(response),
        onError: (DioError e, handler) async =>
            await _onError(e, handler, dio, pref),
      ),
    );
  }
}

_onError(
  DioError e,
  ErrorInterceptorHandler handler,
  Dio dio,
  AppPreferences pref,
) async {
  if (e.response != null &&
      e.response?.statusCode == 401 &&
      (pref.isLogin || pref.isAnonymous)) {
    _performLogout(dio, pref);
    return handler.reject(e);
  }
  return handler.next(e);
}
