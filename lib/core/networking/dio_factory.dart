import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'api_constants.dart';

class DioFactory {
  late final Dio _dio;
  Dio get dio => _dio;

  DioFactory() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl, // ✅ هذا أهم سطر
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        sendTimeout: const Duration(seconds: 5),
        responseType: ResponseType.json,
      ),
    );

    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
       logPrint: (msg) => print(msg),
      ),
    );
  }
}
