import 'package:flutter_base/config/dev.config.dart';
import 'package:flutter_base/config/product.config.dart';

class AppConfig {
  static late BaseConfig config;

  static void setDev() {
    config = DevConfig();
  }

  static void setProd() {
    config = ProductConfig();
  }

  static void setEverionment({required BaseConfig valueConfig}) {
    config = valueConfig;
  }
}

abstract class BaseConfig {
  String get apiSeverUrl;
}
