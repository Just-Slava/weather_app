import 'package:flutter/material.dart';
import 'package:weather_app/core/themes/color_schemes.dart';

class AppTheme {
  final ThemeData appThemeGreenDark = ThemeData(
    useMaterial3: true,
    colorScheme: darkGreenColorScheme,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: darkGreenColorScheme.primary,
      foregroundColor: darkGreenColorScheme.background,
      splashColor: darkGreenColorScheme.onSurfaceVariant,
    ),
    cardTheme: CardTheme(
      elevation: 1,
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.all(0.0),
      color: darkGreenColorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
    ),
    dialogTheme: DialogTheme(
      backgroundColor: darkGreenColorScheme.background,
      elevation: 0,
      alignment: Alignment.center,
    ),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(24.0))),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: darkGreenColorScheme.primary,
          width: 2.0,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(24.0),
        ),
      ),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: darkGreenColorScheme.error),
          borderRadius: const BorderRadius.all(Radius.circular(24.0))),
    ),
    navigationBarTheme: const NavigationBarThemeData(
      elevation: 0,
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
    ),
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: darkGreenColorScheme.background,
      elevation: 0.0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24.0),
        ),
      ),
    ),
    snackBarTheme: const SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
    ),
    chipTheme: const ChipThemeData(
      shape: StadiumBorder(),
      showCheckmark: false,
    ),
    cardColor: darkGreenColorScheme.surface,
  );

  final ThemeData appThemeGreenLight = ThemeData(
    useMaterial3: true,
    colorScheme: lightGreenColorScheme,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: lightGreenColorScheme.primary,
      foregroundColor: lightGreenColorScheme.background,
      splashColor: lightGreenColorScheme.onSurfaceVariant,
    ),
    iconButtonTheme: const IconButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStatePropertyAll(Color(0xFF102A43)),
      ),
    ),
    cardTheme: CardTheme(
      elevation: 1,
      clipBehavior:
          Clip.antiAlias, //In case a Inksplash is parent to the card, this line of code will clip the inksplash
      margin: const EdgeInsets.all(0.0),
      color: lightGreenColorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
    ),
    textTheme: const TextTheme(
      displayMedium: TextStyle(fontFamily: "Inter", fontSize: 46, fontWeight: FontWeight.w500),
      displaySmall: TextStyle(fontFamily: "Inter", fontSize: 41, fontWeight: FontWeight.w500),
      headlineLarge: TextStyle(fontFamily: "Inter", fontSize: 36, fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(fontFamily: "Inter", fontSize: 32, fontWeight: FontWeight.w500),
      headlineSmall: TextStyle(fontFamily: "Inter", fontSize: 28, fontWeight: FontWeight.w500),
      titleLarge: TextStyle(fontFamily: "Inter", fontSize: 25, fontWeight: FontWeight.w500),
      titleMedium: TextStyle(fontFamily: "Inter", fontSize: 23, fontWeight: FontWeight.w500),
      titleSmall: TextStyle(fontFamily: "Inter", fontSize: 20, fontWeight: FontWeight.w500),
      bodyLarge: TextStyle(fontFamily: "Inter", fontSize: 20, fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(fontFamily: "Inter", fontSize: 18, fontWeight: FontWeight.w500),
      bodySmall: TextStyle(fontFamily: "Inter", fontSize: 16, fontWeight: FontWeight.w500),
      labelLarge: TextStyle(fontFamily: "Inter", fontSize: 20, fontWeight: FontWeight.w500),
      labelMedium: TextStyle(fontFamily: "Inter", fontSize: 18, fontWeight: FontWeight.w500),
      labelSmall: TextStyle(fontFamily: "Inter", fontSize: 16, fontWeight: FontWeight.w500),
    ),
    dialogTheme: DialogTheme(
      backgroundColor: lightGreenColorScheme.background,
      elevation: 0,
      alignment: Alignment.center,
    ),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(24.0))),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: lightGreenColorScheme.primary,
          width: 2.0,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(24.0),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: lightGreenColorScheme.error),
        borderRadius: const BorderRadius.all(Radius.circular(24.0)),
      ),
    ),
    navigationBarTheme: const NavigationBarThemeData(
      elevation: 0,
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
    ),
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: lightGreenColorScheme.background,
      elevation: 0.0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24.0),
        ),
      ),
    ),
    snackBarTheme: const SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
    ),
    chipTheme: const ChipThemeData(
      shape: StadiumBorder(),
      showCheckmark: false,
    ),
    cardColor: lightGreenColorScheme.surface,
  );
}
