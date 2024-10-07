import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clip_link/src/core/res/app_color_scheme.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  ThemeData _buildTheme(Brightness brighness) {
    final appColorScheme = AppColorScheme();
    final colorScheme = brighness == Brightness.light
        ? appColorScheme.light
        : appColorScheme.dark;

    final theme = ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: colorScheme.surface,
      colorScheme: colorScheme,
      textTheme: GoogleFonts.robotoTextTheme(),
      inputDecorationTheme: inputDecorationTheme(colorScheme),
      elevatedButtonTheme: elevatedButtonThemeData(colorScheme),
    );
    return theme;
  }

  ThemeData get light => _buildTheme(Brightness.light);
  ThemeData get dark => _buildTheme(Brightness.dark);

  static void initGoogleFonts() {
    GoogleFonts.config.allowRuntimeFetching = false;

    LicenseRegistry.addLicense(() async* {
      final license = await rootBundle.loadString('google_fonts/OFL.txt');
      yield LicenseEntryWithLineBreaks(['google_fonts'], license);
    });
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
}

FontWeight get regular => FontWeight.w400;
FontWeight get medium => FontWeight.w500;
FontWeight get bold => FontWeight.w700;
FontWeight get black => FontWeight.w900;
