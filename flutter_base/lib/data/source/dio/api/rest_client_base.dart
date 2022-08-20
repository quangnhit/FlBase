
import 'package:dio/dio.dart';
import 'package:flutter_base/config/config.dart';
import 'package:flutter_base/data/source/dio/rest_client.dart';

class RestClientBase extends RestClient {
  factory RestClientBase() {
    _singleton ??= RestClientBase._internal(AppConfig.config.apiSeverUrl,
        interceptors: null);
    return _singleton!;
  }

  RestClientBase._internal(String baseUrl, {List<Interceptor>? interceptors})
      : super(baseUrl, interceptors);

  static RestClientBase? _singleton;
}
