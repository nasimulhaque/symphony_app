import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/my_shared_pref.dart';
import 'dark_theme_colors.dart';
import 'light_theme_colors.dart';
import 'my_styles.dart';

class MyTheme {
  static getThemeData({required bool isLight}) {
    return ThemeData(
        primaryColor: isLight ? LightThemeColors.primaryColor : DarkThemeColors.primaryColor,
        colorScheme: ColorScheme.fromSwatch(
          accentColor: isLight ? LightThemeColors.accentColor : DarkThemeColors.accentColor,
          backgroundColor: isLight ? LightThemeColors.backgroundColor : DarkThemeColors.backgroundColor,
          brightness: isLight ? Brightness.light : Brightness.dark,
        ).copyWith(
          secondary: isLight ? LightThemeColors.accentColor : DarkThemeColors.accentColor,
        ),
        brightness: isLight ? Brightness.light : Brightness.dark,
        cardColor: isLight ? LightThemeColors.cardColor : DarkThemeColors.cardColor,
        hintColor: isLight ? LightThemeColors.hintTextColor : DarkThemeColors.hintTextColor,
        dividerColor: isLight ? LightThemeColors.dividerColor : DarkThemeColors.dividerColor,
        scaffoldBackgroundColor:
            isLight ? LightThemeColors.scaffoldBackgroundColor : DarkThemeColors.scaffoldBackgroundColor,
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: isLight ? LightThemeColors.primaryColor : DarkThemeColors.primaryColor,
        ),
        appBarTheme: MyStyles.getAppBarTheme(isLightTheme: isLight),
        elevatedButtonTheme: MyStyles.getElevatedButtonTheme(isLightTheme: isLight),
        textTheme: MyStyles.getTextTheme(isLightTheme: isLight),
        iconTheme: MyStyles.getIconTheme(isLightTheme: isLight),
    );
  }

  static changeTheme() {
    bool isLightTheme = MySharedPref.getThemeIsLight();
    MySharedPref.setThemeIsLight(!isLightTheme);
    Get.changeThemeMode(!isLightTheme ? ThemeMode.light : ThemeMode.dark);
  }

  bool get getThemeIsLight => MySharedPref.getThemeIsLight();
}
