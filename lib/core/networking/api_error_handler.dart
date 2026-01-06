
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:restapigetx/core/networking/api_error_factory.dart';
import 'package:restapigetx/core/networking/api_error_model.dart';
import 'package:restapigetx/core/networking/dio_extention_exceptio_type.dart';
import 'package:restapigetx/core/networking/local_states_codes.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic e) {
    if (e is Exception) {
      if (e is DioException) {
        return e.when(
          connectionError: () => ApiErrorModel(
            errorMessage:
                "No internet connection. Please check your Wi-Fi or mobile data.",
            errors: [],
            icon: Icons.wifi_off,
            statuscode: LocalStatusCodes.connectionError,
          ),
          connectionTimeout: () => ApiErrorModel(
            errorMessage:
                "The connection took too long. Try checking your internet or try again later.",
            icon: Icons.timer_off,
            statuscode: LocalStatusCodes.connectionTimeout,
            errors: [],
          ),
          sendTimeout: () => ApiErrorModel(
            errorMessage:
                "Request timed out while sending data. Please try again.",
            icon: Icons.send,
            statuscode: LocalStatusCodes.sendTimeout,
            errors: [],
          ),
          receiveTimeout: () => ApiErrorModel(
            errorMessage:
                "Server took too long to respond. Please try again later.",
            icon: Icons.downloading,
            statuscode: LocalStatusCodes.receiveTimeout,
            errors: [],
          ),
          badCertificate: () => ApiErrorModel(
            errorMessage:
                "Security issue detected with the server. Connection not secure.",
            icon: Icons.security,
            statuscode: LocalStatusCodes.badCertificate,
            errors: [],
          ),
          badResponse: () {
            final allErrors =
                e.response?.data["errors"] as Map<String, dynamic>?;
            final errorsList = <String>[];
            if (allErrors != null) {
              allErrors.forEach((key, value) {
                for (var e in (value as List)) {
                  final String singleErrMessage = "$key: $e";
                  errorsList.add(singleErrMessage);
                }
              });
            }
            return ApiErrorModel(
              statuscode:e.response?.statusCode,
              errorMessage: e.response?.data["message"],
              errors: errorsList,
              icon: Icons.error,
            );
          },
          cancel: () => ApiErrorModel(
            errorMessage: "The request was cancelled. Please try again.",
            icon: Icons.cancel,
            statuscode: LocalStatusCodes.cancel,
            errors: [],
          ),
          unknown: () => ApiErrorModel(
            errorMessage:
                "Something went wrong. Please check your connection and try again.",
            icon: Icons.error_outline,
            statuscode: LocalStatusCodes.unknown,
            errors: [],
          ),
        );
      }
    }
    return ApiErrorFactory.defaultError;
  }
}
