import 'package:flutter_base/controller/global_data_manager.dart';
import 'package:flutter_base/data/source/dio/api/rest_client_base.dart';
import 'package:flutter_base/global/app_theme.dart';
import 'package:flutter_base/loading_wrapper.dart';
import 'package:get/get.dart';
import 'package:flutter_base/import.dart';

Future<void> setupLocator() async {
  Get.put<AppThemeBase>(AppThemeBase());

  Get.put<LoadingController>(LoadingController());

  Get.put<RestClientBase>(RestClientBase());

  Get.put<GlobalDataManager>(GlobalDataManager());
}
