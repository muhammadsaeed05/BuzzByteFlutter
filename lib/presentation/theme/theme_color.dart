import 'dart:ui';

import 'package:flutter/material.dart';

class ThemeColor {
  const ThemeColor._();

  static const Color lightBackgroundColor = Color(0xFFF0F0F0);
  static const Color lightPrimaryColor = Color(0xFF4B57A9);
  static const Color lightSecondaryColor = Color(0xFF395BA9);
  static const Color lightTextColor = Color(0xFF333333);
  static const Color lightAccentColor = Color(0xFF4459A9);
  static const Color lightNeutralColor = Color(0xFFCCCCCC);

  static const Color darkBackgroundColor = Color(0xFF333333);
  static const Color darkPrimaryColor = Color(0xFF455A64);
  static const Color darkSecondaryColor = Color(0xFF00796B);
  static const Color darkTextColor = Color(0xFFBBBBBB);
  static const Color darkAccentColor = Color(0xFFFFC107);
  static const Color darkNeutralColor = Color(0xFFCCCCCC);

  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF4B57A9),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFDFE0FF),
    onPrimaryContainer: Color(0xFF000D5F),
    secondary: Color(0xFF395BA9),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFDAE2FF),
    onSecondaryContainer: Color(0xFF001947),
    tertiary: Color(0xFF4459A9),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFDCE1FF),
    onTertiaryContainer: Color(0xFF001552),
    error: Color(0xFFBA1A1A),
    errorContainer: Color(0xFFFFDAD6),
    onError: Color(0xFFFFFFFF),
    onErrorContainer: Color(0xFF410002),
    background: Color(0xFFF8FDFF),
    onBackground: Color(0xFF001F25),
    surface: Color(0xFFF8FDFF),
    onSurface: Color(0xFF001F25),
    surfaceVariant: Color(0xFFE3E1EC),
    onSurfaceVariant: Color(0xFF46464F),
    outline: Color(0xFF767680),
    onInverseSurface: Color(0xFFD6F6FF),
    inverseSurface: Color(0xFF00363F),
    inversePrimary: Color(0xFFBBC3FF),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF4B57A9),
    outlineVariant: Color(0xFFC7C5D0),
    scrim: Color(0xFF000000),
  );

  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFBBC3FF),
    onPrimary: Color(0xFF192678),
    primaryContainer: Color(0xFF323F90),
    onPrimaryContainer: Color(0xFFDFE0FF),
    secondary: Color(0xFFB1C5FF),
    onSecondary: Color(0xFF002C71),
    secondaryContainer: Color(0xFF1D438F),
    onSecondaryContainer: Color(0xFFDAE2FF),
    tertiary: Color(0xFFB7C4FF),
    onTertiary: Color(0xFF0D2878),
    tertiaryContainer: Color(0xFF2A4190),
    onTertiaryContainer: Color(0xFFDCE1FF),
    error: Color(0xFFFFB4AB),
    errorContainer: Color(0xFF93000A),
    onError: Color(0xFF690005),
    onErrorContainer: Color(0xFFFFDAD6),
    background: Color(0xFF001F25),
    onBackground: darkTextColor,
    surface: Color(0xFF001F25),
    onSurface: Color(0xFFFFFFFF),
    surfaceVariant: Color(0xFF46464F),
    onSurfaceVariant: Color(0xFFC7C5D0),
    outline: Color(0xFF90909A),
    onInverseSurface: Color(0xFF001F25),
    inverseSurface: Color(0xFFA6EEFF),
    inversePrimary: Color(0xFF4B57A9),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFFBBC3FF),
    outlineVariant: Color(0xFF46464F),
    scrim: Color(0xFF000000),
  );
}
