import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = FlexThemeData.light(
    useMaterial3: true,
    scheme: FlexScheme.green,
    appBarStyle: FlexAppBarStyle.primary,
    tabBarStyle: FlexTabBarStyle.forAppBar,
    swapColors: true,
    subThemesData: const FlexSubThemesData(
      bottomAppBarSchemeColor: SchemeColor.primary,
    ),
  );

  static ThemeData darkTheme = FlexThemeData.dark(
      useMaterial3: true,
      scheme: FlexScheme.bigStone,
      appBarStyle: FlexAppBarStyle.primary,
      tabBarStyle: FlexTabBarStyle.forAppBar,
      swapColors: true,
      subThemesData: const FlexSubThemesData(bottomAppBarSchemeColor: SchemeColor.primary)
      // darkIsTrueBlack: true,
      );
}
