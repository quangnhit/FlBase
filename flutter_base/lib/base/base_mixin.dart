import 'package:flutter_base/global/app_const.dart';
import 'package:flutter_base/global/app_theme.dart';
import 'package:flutter_base/import.dart';
import 'package:flutter_base/utils/localization_service.dart';

export 'package:flutter/material.dart';
export 'package:get/get.dart';

mixin BaseMixin {
  AppTheme get color => Get.find<AppThemeBase>().theme;

  bool get vn => LocalizationService.locale.languageCode == AppConst.langVI;

  AppTextStyle get textStyle => AppTextStyle.share;

  AppSized get sized => AppSized.share;
}

mixin MixinWidget<T extends StatelessWidget> on BaseMixin {}
