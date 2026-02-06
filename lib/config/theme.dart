import 'package:flutter/material.dart';
import 'package:heroshop_app/config/colors.dart';

class AppTheme {
  AppTheme._();

  // ================= LIGHT COLOR SCHEME =================
  static final lightColorScheme = ColorScheme(
    brightness: Brightness.light,

    primary: AppColors.primaryLight,
    onPrimary: AppColors.onPrimaryLight,
    primaryContainer: AppColors.primaryVariantLight,
    onPrimaryContainer: AppColors.onPrimaryLight,

    secondary: AppColors.secondaryLight,
    onSecondary: AppColors.onSecondaryLight,
    secondaryContainer: AppColors.secondaryVariantLight,
    onSecondaryContainer: AppColors.onSecondaryLight,

    surface: AppColors.backgroundLight,
    onSurface: AppColors.onBackgroundLight,

    surfaceContainerHighest: AppColors.dividerLight,
    onSurfaceVariant: AppColors.textSecondaryLight,

    error: AppColors.errorLight,
    onError: AppColors.onErrorLight,
    errorContainer: AppColors.errorLight.withValues(alpha: .15),
    onErrorContainer: AppColors.onErrorLight,
  );

  // ================= DARK COLOR SCHEME =================
  static final darkColorScheme = ColorScheme(
    brightness: Brightness.dark,

    primary: AppColors.primaryDark,
    onPrimary: AppColors.onPrimaryDark,
    primaryContainer: AppColors.primaryVariantDark,
    onPrimaryContainer: AppColors.onPrimaryDark,

    secondary: AppColors.secondaryDark,
    onSecondary: AppColors.onSecondaryDark,
    secondaryContainer: AppColors.secondaryVariantDark,
    onSecondaryContainer: AppColors.onSecondaryDark,

    surface: AppColors.backgroundDark,
    onSurface: AppColors.onBackgroundDark,

    surfaceContainerHighest: AppColors.dividerDark,
    onSurfaceVariant: AppColors.textSecondaryDark,

    error: AppColors.errorDark,
    onError: AppColors.onErrorDark,
    errorContainer: AppColors.errorDark.withValues(alpha: .2),
    onErrorContainer: AppColors.onErrorDark,
  );

  // ================= LIGHT THEME =================
  static final lightTheme = ThemeData(
    fontFamily: 'IranSans',

    useMaterial3: true,
    colorScheme: lightColorScheme,
    scaffoldBackgroundColor: lightColorScheme.surface,

    appBarTheme: AppBarTheme(
      backgroundColor: lightColorScheme.primaryContainer,
      foregroundColor: lightColorScheme.onPrimaryContainer,
      // titleTextStyle: TextStyle(color: lightColorScheme.onPrimary),
      elevation: 0,
    ),

    cardTheme: CardThemeData(
      color: lightColorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),

    dividerTheme: const DividerThemeData(
      color: AppColors.dividerLight,
      thickness: 1,
    ),

    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.borderLight),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.borderFocusedLight),
        borderRadius: BorderRadius.circular(8),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.borderErrorLight),
        borderRadius: BorderRadius.circular(8),
      ),
    ),

    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: AppColors.textPrimaryLight),
      bodySmall: TextStyle(color: AppColors.textSecondaryLight),
      labelSmall: TextStyle(color: AppColors.textDisabledLight),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryLight,
        foregroundColor: AppColors.onPrimaryLight,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
  );

  // ================= DARK THEME =================
  static final darkTheme = ThemeData(
    fontFamily: 'IranSans',

    useMaterial3: true,
    colorScheme: darkColorScheme,
    scaffoldBackgroundColor: darkColorScheme.surface,

    appBarTheme: AppBarTheme(
      backgroundColor: darkColorScheme.primaryContainer,
      foregroundColor: darkColorScheme.onPrimaryContainer,

      // titleTextStyle: TextStyle(color: darkColorScheme.onPrimary),
      elevation: 0,
    ),

    cardTheme: CardThemeData(
      color: darkColorScheme.surface,
      shadowColor: Colors.black.withValues(alpha: .5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),

    dividerTheme: const DividerThemeData(
      color: AppColors.dividerDark,
      thickness: 1,
    ),

    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.borderDark),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.borderFocusedDark),
        borderRadius: BorderRadius.circular(8),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.borderErrorDark),
        borderRadius: BorderRadius.circular(8),
      ),
    ),

    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: AppColors.textPrimaryDark),
      bodySmall: TextStyle(color: AppColors.textSecondaryDark),
      labelSmall: TextStyle(color: AppColors.textDisabledDark),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryDark,
        foregroundColor: AppColors.onPrimaryDark,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
  );
}
