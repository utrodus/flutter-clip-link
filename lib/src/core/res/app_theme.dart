import 'package:flutter/material.dart';
import 'package:flutter_clip_link/src/core/res/app_color_scheme.dart';

class AppTheme {
  final String _fontFamily = 'Roboto';

  ThemeData get light => _buildTheme(Brightness.light);
  ThemeData get dark => _buildTheme(Brightness.dark);

  ThemeData _buildTheme(Brightness brighness) {
    final appColorScheme = AppColorScheme();
    final isDark = brighness == Brightness.dark;
    final colorScheme = isDark ? appColorScheme.dark : appColorScheme.light;

    final theme = ThemeData(
      useMaterial3: true,
      fontFamily: _fontFamily,
      scaffoldBackgroundColor: colorScheme.surface,
      colorScheme: colorScheme,
      textTheme: textTheme(colorScheme),
      inputDecorationTheme: inputDecorationTheme(colorScheme),
      elevatedButtonTheme: elevatedButtonThemeData(colorScheme),
      snackBarTheme: snackBarThemeData(colorScheme),
    );
    return theme;
  }

  SnackBarThemeData snackBarThemeData(ColorScheme colorScheme) {
    return SnackBarThemeData(
      backgroundColor: colorScheme.inverseSurface,
      contentTextStyle: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14,
        height: 1.43,
        fontWeight: regular,
        color: colorScheme.onInverseSurface,
        letterSpacing: 0.25,
      ),
      actionTextColor: colorScheme.inversePrimary,
      elevation: 3,
      closeIconColor: colorScheme.onInverseSurface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  InputDecorationTheme inputDecorationTheme(ColorScheme colorScheme) =>
      InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: colorScheme.outline,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(4)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 3,
            color: colorScheme.primary,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(4)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: colorScheme.outline,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(4)),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: colorScheme.onSurface.withOpacity(0.12),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(4)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: colorScheme.error,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(4)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: colorScheme.error,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(4)),
        ),
      );

  /// Elevated Button Theme Configs
  ElevatedButtonThemeData elevatedButtonThemeData(ColorScheme colorScheme) =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          disabledBackgroundColor: colorScheme.onSurface.withOpacity(0.12),
          disabledForegroundColor: colorScheme.onSurface,
          padding: const EdgeInsets.symmetric(
            vertical: 13,
            horizontal: 24,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          elevation: 0,
        ),
      );

  TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        displayLarge: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 57,
          height: 1.12,
          fontWeight: regular,
          color: colorScheme.onSurface,
          letterSpacing: -0.25,
        ),
        displayMedium: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 45,
          height: 1.16,
          fontWeight: regular,
          color: colorScheme.onSurface,
        ),
        displaySmall: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 36,
          height: 1.22,
          fontWeight: regular,
          color: colorScheme.onSurface,
        ),
        headlineLarge: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 32,
          height: 1.25,
          fontWeight: regular,
          color: colorScheme.onSurface,
        ),
        headlineMedium: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 28,
          height: 1.29,
          fontWeight: regular,
          color: colorScheme.onSurface,
        ),
        headlineSmall: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 24,
          height: 1.33,
          fontWeight: regular,
          color: colorScheme.onSurface,
        ),
        titleLarge: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 22,
          height: 1.27,
          fontWeight: regular,
          color: colorScheme.onSurface,
        ),
        titleMedium: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 16,
          height: 1.5,
          fontWeight: medium,
          color: colorScheme.onSurface,
          letterSpacing: 0.15,
        ),
        titleSmall: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 14,
          height: 1.43,
          fontWeight: medium,
          color: colorScheme.onSurface,
          letterSpacing: 0.1,
        ),
        labelLarge: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 14,
          height: 1.43,
          fontWeight: medium,
          color: colorScheme.onSurface,
          letterSpacing: 0.1,
        ),
        labelMedium: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 12,
          height: 1.33,
          fontWeight: medium,
          color: colorScheme.onSurface,
          letterSpacing: 0.5,
        ),
        labelSmall: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 11,
          height: 1.45,
          fontWeight: medium,
          color: colorScheme.onSurface,
          letterSpacing: 0.5,
        ),
        bodyLarge: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 16,
          height: 1.5,
          fontWeight: regular,
          color: colorScheme.onSurface,
          letterSpacing: 0.5,
        ),
        bodyMedium: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 14,
          height: 1.43,
          fontWeight: regular,
          color: colorScheme.onSurface,
          letterSpacing: 0.25,
        ),
        bodySmall: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 12,
          height: 1.33,
          fontWeight: regular,
          color: colorScheme.onSurface,
          letterSpacing: 0.4,
        ),
      );
}

FontWeight get regular => FontWeight.w400;
FontWeight get medium => FontWeight.w500;
FontWeight get bold => FontWeight.w700;
FontWeight get black => FontWeight.w900;
