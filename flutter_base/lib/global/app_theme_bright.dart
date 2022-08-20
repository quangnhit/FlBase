import 'package:flutter/material.dart';

import 'app_text_style.dart';
import 'app_theme.dart';

class AppThemeBright extends AppTheme {
  AppTextStyle get textStyle => AppTextStyle.share;

  @override
  ThemeData get theme => ThemeData(
      // scaffoldBackgroundColor: background0,
      // backgroundColor: background0,
      // primaryColor: primary,
      // dialogBackgroundColor: grey90,
      fontFamily: 'SF-REGULAR',
      appBarTheme: _buildAppBarTheme,
      bottomAppBarTheme: _buildBottomAppBarTheme,
      dialogTheme: _buildDialogTheme);

  // appbar
  AppBarTheme get _buildAppBarTheme => AppBarTheme(
        // backgroundColor: grey90, centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: grey0),
        // textTheme: TextTheme(),
        titleTextStyle:
            TextStyle(color: grey0, fontSize: 16, fontFamily: 'SF-REGULAR'),
      );
  BottomAppBarTheme get _buildBottomAppBarTheme =>
      const BottomAppBarTheme(elevation: 0, color: Colors.red);

  DialogTheme get _buildDialogTheme => const DialogTheme(elevation: 0);

  
  @override
  Color get grey0 => const Color(0xFF000000);
}