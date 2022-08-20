import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base/config/config.dart';
import 'package:flutter_base/locator.dart';
import 'package:flutter_base/main.dart';
import 'package:get_storage/get_storage.dart';

class BaseRunMain {
  static Future<void> runMainApp({required BaseConfig config}) async {
    runZonedGuarded(() async {
      WidgetsFlutterBinding.ensureInitialized();
      await SystemChrome.setPreferredOrientations(
          <DeviceOrientation>[DeviceOrientation.portraitUp]);

      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light));

      await GetStorage.init();
      AppConfig.setEverionment(valueConfig: config);

      await setupLocator();

      runApp(const MyApp());
    }, (Object error, StackTrace stackTrace) {});
  }
}
