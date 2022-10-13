import 'dart:ui';

import 'app_theme.dart';
import 'package:flutter_base/import.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  static final AppTextStyle share = AppTextStyle();

  TextStyle bold({
    double? size,
    Color? color,
    Color? backgroundColor,
  }) =>
      custom(
          fontFamily: 'SF-BOLD',
          size: size,
          color: color,
          fontWeight: FontWeight.w700,
          backgroundColor: backgroundColor);

  TextStyle semiBold({
    double? size,
    Color? color,
    Color? backgroundColor,
  }) =>
      custom(
          fontFamily: 'SF-BOLD',
          size: size,
          color: color,
          fontWeight: FontWeight.w600,
          backgroundColor: backgroundColor);

  TextStyle medium({
    double? size,
    Color? color,
    Color? backgroundColor,
  }) =>
      custom(
          fontFamily: 'SF-MEDIUM',
          size: size,
          color: color,
          fontWeight: FontWeight.w500,
          backgroundColor: backgroundColor);

  TextStyle regular({
    double? size,
    Color? color,
    Color? backgroundColor,
  }) =>
      custom(
          fontFamily: 'SF-REGULAR',
          size: size,
          color: color,
          fontWeight: FontWeight.w400,
          backgroundColor: backgroundColor);

  TextStyle custom(
      {double? size,
      Color? color,
      Color? backgroundColor,
      FontWeight? fontWeight,
      FontStyle? fontStyle,
      String fontFamily = 'SF-REGULAR'}) {
    return TextStyle(
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      fontSize: size ?? 13,
      color: color ?? baseColor.grey0,
      fontFeatures: const <FontFeature>[
        FontFeature.tabularFigures(),
      ],
    );
  }
}
