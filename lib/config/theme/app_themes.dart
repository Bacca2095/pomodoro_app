import 'package:flutter/material.dart';

final ColorScheme defaultLightScheme =
    ColorScheme.fromSeed(seedColor: Colors.blueGrey);

final ColorScheme defaultDarkScheme = ColorScheme.fromSeed(
    seedColor: Colors.blueGrey, brightness: Brightness.dark);

ThemeData theme(
  BuildContext context,
  ColorScheme? scheme,
) {
  return ThemeData(
    appBarTheme:
        scheme != null ? appBarTheme(scheme) : appBarTheme(defaultLightScheme),
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      filled: true,
      border: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
    ),
    colorScheme: scheme,
    elevatedButtonTheme: scheme != null
        ? elevatedButtonTheme(scheme)
        : elevatedButtonTheme(defaultLightScheme),
    outlinedButtonTheme: scheme != null
        ? outlinedButtonTheme(scheme)
        : outlinedButtonTheme(defaultLightScheme),
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

AppBarTheme appBarTheme(ColorScheme scheme) {
  return AppBarTheme(
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(color: scheme.primary),
    titleTextStyle: const TextStyle(
        color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
  );
}

ElevatedButtonThemeData elevatedButtonTheme(ColorScheme scheme) {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: scheme.primary,
      foregroundColor: scheme.background,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

OutlinedButtonThemeData outlinedButtonTheme(ColorScheme scheme) {
  return OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
