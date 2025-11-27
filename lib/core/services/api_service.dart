import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

import 'package:uitraining/core/consts/api_consts.dart';

class ApiService extends GetxService {
  late final Dio _dio;

  Future<ApiService> init() async {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConsts.baseUrl,
        connectTimeout: Duration(seconds: 5000),
        receiveTimeout: Duration(seconds: 5000),
        headers: {"Accept": "application/json", "User-Agent": "Mozilla/5.0"},
      ),
    );

    return this;
  }

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _dio.get(path, queryParameters: queryParameters);
  }
}
