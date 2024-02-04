// ignore_for_file: avoid_print
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:in_service/core/consts/app_strings.dart';
import 'package:in_service/core/util/extensions.dart';
import 'package:get/get.dart' as getx;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_exceptions.freezed.dart';

@Freezed()
abstract class NetworkExceptions with _$NetworkExceptions {
  const factory NetworkExceptions.requestCancelled() = RequestCancelled;

  const factory NetworkExceptions.unauthorizedRequest(String reason) =
      UnauthorizedRequest;

  const factory NetworkExceptions.badRequest(String reason) = BadRequest;

  const factory NetworkExceptions.notFound(String reason) = NotFound;

  const factory NetworkExceptions.methodNotAllowed() = MethodNotAllowed;

  const factory NetworkExceptions.notAcceptable() = NotAcceptable;

  const factory NetworkExceptions.requestTimeout() = RequestTimeout;

  const factory NetworkExceptions.sendTimeout() = SendTimeout;

  const factory NetworkExceptions.unprocessableEntity(String reason) =
      UnprocessableEntity;

  const factory NetworkExceptions.conflict() = Conflict;

  const factory NetworkExceptions.internalServerError() = InternalServerError;

  const factory NetworkExceptions.notImplemented() = NotImplemented;

  const factory NetworkExceptions.serviceUnavailable() = ServiceUnavailable;

  const factory NetworkExceptions.noInternetConnection() = NoInternetConnection;

  const factory NetworkExceptions.formatException() = FormatException;

  const factory NetworkExceptions.unableToProcess() = UnableToProcess;

  const factory NetworkExceptions.defaultError(String error) = DefaultError;

  const factory NetworkExceptions.unexpectedError() = UnexpectedError;

  static NetworkExceptions handleResponse(Response? response) {
    List<String> errors = [];
    if (response != null) {
      var res =
          response.data is Map ? response.data : json.decode(response.data);
      print("$res");
      print("res is Map >>>>>>> ${res is Map}");
      print("res is String >>>>>>> ${res is String}");

      if (res is Map) {
        (res).forEach((k, v) => errors.add("${(v is List) ? v.first : v}\n"));
      } else {
        errors.add(res.toString().valide());
      }
    }

    String error = errors
        .toString()
        .replaceAll("}", "")
        .replaceAll("{", "")
        .replaceAll("[", "")
        .replaceAll("]", "")
        .replaceAll("'", "")
        .replaceAll('"', "")
        .replaceAll(",", "")
        .trim();
    int statusCode = response?.statusCode ?? 0;
    switch (statusCode) {
      case 401:
        return NetworkExceptions.unauthorizedRequest(error);
      case 400:
        // case 403:
        return NetworkExceptions.badRequest(error);
      case 404:
        return NetworkExceptions.notFound(error);
      case 409:
        return const NetworkExceptions.conflict();
      case 408:
        return const NetworkExceptions.requestTimeout();
      case 422:
        return NetworkExceptions.unprocessableEntity(error);
      case 500:
        return const NetworkExceptions.internalServerError();
      case 503:
        return const NetworkExceptions.serviceUnavailable();
      default:
        debugPrint("Received invalid status code: $statusCode");
        return NetworkExceptions.defaultError(Kstrings.somethingWrong.tr);
    }
  }

  static NetworkExceptions getDioException(error) {
    if (error is Exception) {
      try {
        NetworkExceptions networkExceptions;
        if (error is DioError) {
          networkExceptions = _dioError(error);
        } else if (error is SocketException) {
          networkExceptions = const NetworkExceptions.noInternetConnection();
        } else {
          networkExceptions = const NetworkExceptions.unexpectedError();
        }
        return networkExceptions;
      } on FormatException catch (_) {
        return const NetworkExceptions.formatException();
      } catch (_) {
        return const NetworkExceptions.unexpectedError();
      }
    } else {
      debugPrint("Error ====> $error");
      if (error.toString().contains("is not a subtype of")) {
        return const NetworkExceptions.unableToProcess();
      } else {
        return const NetworkExceptions.unexpectedError();
      }
    }
  }

  static NetworkExceptions _dioError(DioError error) => switch (error.type) {
        DioErrorType.cancel => const NetworkExceptions.requestCancelled(),
        DioErrorType.connectTimeout => const NetworkExceptions.requestTimeout(),
        DioErrorType.other => const NetworkExceptions.noInternetConnection(),
        DioErrorType.receiveTimeout => const NetworkExceptions.sendTimeout(),
        DioErrorType.response =>
          NetworkExceptions.handleResponse(error.response),
        DioErrorType.sendTimeout => const NetworkExceptions.sendTimeout()
      };

  static String getErrorMessage(NetworkExceptions networkExceptions) {
    String errorMessage = "";
    networkExceptions.when(
      notImplemented: () => errorMessage = "notImplemented".tr,
      requestCancelled: () => errorMessage = "requestCancelled".tr,
      internalServerError: () => errorMessage = "internalServerError".tr,
      // notFound: (String error) => errorMessage = error;,
      notFound: (String error) => errorMessage = error,
      serviceUnavailable: () => errorMessage = "serviceUnavailable".tr,
      methodNotAllowed: () => errorMessage = "methodNotAllowed".tr,
      badRequest: (String error) => errorMessage = error,
      unauthorizedRequest: (String reason) => errorMessage = reason,
      unprocessableEntity: (String error) => errorMessage = error,
      unexpectedError: () => errorMessage = "unexpectedError".tr,
      requestTimeout: () => errorMessage = "requestTimeout".tr,
      noInternetConnection: () => errorMessage = "noInternetConnection".tr,
      conflict: () => errorMessage = "conflict".tr,
      sendTimeout: () => errorMessage = "sendTimeout".tr,
      unableToProcess: () => errorMessage = "unableToProcess".tr,
      defaultError: (String error) => errorMessage = error,
      formatException: () => errorMessage = "formatException".tr,
      notAcceptable: () => errorMessage = "notAcceptable".tr,
    );
    return errorMessage;
  }
}
