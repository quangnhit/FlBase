
import 'package:dio/dio.dart';
import 'package:flutter_base/config/config.dart';
import 'package:flutter_base/data/source/dio/rest_client.dart';

class RestClientAuth extends RestClient {
  factory RestClientAuth() {
    _singleton ??= RestClientAuth._internal(AppConfig.config.apiSeverUrl,
        interceptors: null);
    return _singleton!;
  }

  RestClientAuth._internal(String baseUrl, {List<Interceptor>? interceptors})
      : super(baseUrl, interceptors);

  static RestClientAuth? _singleton;
}
