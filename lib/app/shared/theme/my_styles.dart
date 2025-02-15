import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dark_theme_colors.dart';
import 'my_fonts.dart';
import 'light_theme_colors.dart';

class MyStyles {
  static IconThemeData getIconTheme({required bool isLightTheme}) => IconThemeData(
    color: isLightTheme ? LightThemeColors.iconColor : DarkThemeColors.iconColor,
  );

  static AppBarTheme getAppBarTheme({required bool isLightTheme}) => AppBarTheme(
    elevation: 0,
    titleTextStyle: getTextTheme(isLightTheme: isLightTheme).bodyMedium!.copyWith(
      color: Colors.white,
      fontSize: MyFonts.appBarTittleSize,
    ),
    iconTheme: IconThemeData(color: isLightTheme ? LightThemeColors.appBarIconsColor : DarkThemeColors.appBarIconsColor),
    backgroundColor: isLightTheme ? LightThemeColors.appBarColor : DarkThemeColors.appbarColor,
  );

  static TextTheme getTextTheme({required bool isLightTheme}) => TextTheme(
    labelLarge: MyFonts.buttonTextStyle.copyWith(
      fontSize: MyFonts.buttonTextSize,
      letterSpacing: .2, fontWeight: FontWeight.w700,
      color: isLightTheme ? LightThemeColors.bodyTextColor : DarkThemeColors.bodyTextColor,
    ),
    labelMedium: MyFonts.buttonTextStyle.copyWith(
      fontSize: MyFonts.bodyLargeSize,
      letterSpacing: .2, fontWeight: FontWeight.w500,
      color: isLightTheme ? LightThemeColors.bodyTextColor : DarkThemeColors.bodyTextColor,
    ),
    bodyLarge: (MyFonts.bodyTextStyle).copyWith(
      fontWeight: FontWeight.bold,
      fontSize: MyFonts.bodyLargeSize,
      color: isLightTheme ? LightThemeColors.bodyTextColor : DarkThemeColors.bodyTextColor,
    ),
    bodyMedium: (MyFonts.bodyTextStyle).copyWith(
      fontSize: MyFonts.bodyMediumSize,
      color: isLightTheme ? LightThemeColors.bodyTextColor : DarkThemeColors.bodyTextColor,
    ),
    displayLarge: (MyFonts.displayTextStyle).copyWith(
      fontSize: MyFonts.displayLargeSize,
      fontWeight: FontWeight.bold,
      color: isLightTheme ? LightThemeColors.displayTextColor : DarkThemeColors.displayTextColor,
    ),
    bodySmall: TextStyle(
      color: isLightTheme ? LightThemeColors.bodySmallTextColor : DarkThemeColors.bodySmallTextColor,
      fontSize: MyFonts.bodySmallTextSize
    ),
    displayMedium: (MyFonts.displayTextStyle).copyWith(
      fontSize: MyFonts.displayMediumSize,
      fontWeight: FontWeight.bold,
      color: isLightTheme ? LightThemeColors.displayTextColor : DarkThemeColors.displayTextColor
    ),
    displaySmall: (MyFonts.displayTextStyle).copyWith(
      fontSize: MyFonts.displaySmallSize,
      fontWeight: FontWeight.bold,
      color: isLightTheme ? LightThemeColors.displayTextColor : DarkThemeColors.displayTextColor,
    ),
    labelSmall: (MyFonts.displayTextStyle).copyWith(
      fontSize: MyFonts.displaySmallSize,
      fontWeight: FontWeight.bold,
      color: isLightTheme ? LightThemeColors.primaryColor : DarkThemeColors.primaryColor,
    ),
  );

  static WidgetStateProperty<TextStyle?>? getElevatedButtonTextStyle(bool isLightTheme,
      {bool isBold = true, double? fontSize}) {
    return WidgetStateProperty.resolveWith<TextStyle>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.pressed)) {
          return MyFonts.buttonTextStyle.copyWith(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            fontSize: fontSize ?? MyFonts.buttonTextSize,
            color: isLightTheme ? LightThemeColors.buttonTextColor : DarkThemeColors.buttonTextColor,
          );
        } else if (states.contains(WidgetState.disabled)) {
          return MyFonts.buttonTextStyle.copyWith(
            fontSize: fontSize ?? MyFonts.buttonTextSize,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            color: isLightTheme ? LightThemeColors.buttonDisabledTextColor : DarkThemeColors.buttonDisabledTextColor,
          );
        }
        return MyFonts.buttonTextStyle.copyWith(
          fontSize: fontSize ?? MyFonts.buttonTextSize,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          color: isLightTheme ? LightThemeColors.buttonTextColor : DarkThemeColors.buttonTextColor,
        ); // Use the component's default.
      },
    );
  }

  static ElevatedButtonThemeData getElevatedButtonTheme({required bool isLightTheme}) => ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.r),
        ),
      ),
      elevation: WidgetStateProperty.all(0),
      padding: WidgetStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 8.h)),
      textStyle: getElevatedButtonTextStyle(isLightTheme),
      backgroundColor: WidgetStateProperty.resolveWith<Color>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.pressed)) {
            return isLightTheme
              ? LightThemeColors.buttonColor.withOpacity(0.5)
              : DarkThemeColors.buttonColor.withOpacity(0.5);
          } else if (states.contains(WidgetState.disabled)) {
            return isLightTheme ? LightThemeColors.buttonDisabledColor : DarkThemeColors.buttonDisabledColor;
          }
          return isLightTheme
            ? LightThemeColors.buttonColor
            : DarkThemeColors.buttonColor; // Use the component's default.
        },
      ),
    ),
  );
}
