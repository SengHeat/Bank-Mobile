import 'package:flutter/material.dart';

class AppThemes {

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.teal,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.teal,
      foregroundColor: Colors.white,
      elevation: 0, // Optional: Remove shadow for a flat app bar
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black, fontSize: 18), // Larger body text
      bodyMedium: TextStyle(color: Colors.black54, fontSize: 16), // Medium body text
      bodySmall: TextStyle(color: Colors.black45, fontSize: 14), // Smaller body text
      headlineLarge: TextStyle(color: Colors.teal, fontSize: 32, fontWeight: FontWeight.bold), // Large heading
      headlineMedium: TextStyle(color: Colors.teal, fontSize: 24, fontWeight: FontWeight.w600), // Medium heading
      headlineSmall: TextStyle(color: Colors.teal, fontSize: 20, fontWeight: FontWeight.w500), // Small heading
      titleLarge: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500), // Large title
      titleMedium: TextStyle(color: Colors.black87, fontSize: 18, fontWeight: FontWeight.w400), // Medium title
      titleSmall: TextStyle(color: Colors.black45, fontSize: 16), // Small title
      labelLarge: TextStyle(color: Colors.teal, fontSize: 14), // Label text style
      labelMedium: TextStyle(color: Colors.black, fontSize: 12), // Medium label
      labelSmall: TextStyle(color: Colors.black54, fontSize: 10), // Small label
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, // Text color
        backgroundColor: Colors.teal, // Button background color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Rounded corners
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.teal, // Text color for TextButton
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.teal, side: const BorderSide(color: Colors.teal), // Border color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Rounded corners
        ),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Colors.teal, // Color for selected item
      unselectedItemColor: Colors.grey, // Color for unselected item
      type: BottomNavigationBarType.fixed, // Fixed type for consistent look
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true, // Whether the input field has a background color
      fillColor: Colors.grey.shade200, // Background color of the input field
      contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16), // Padding inside the input field
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8), // Rounded corners
        borderSide: BorderSide.none, // No border line when idle
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8), // Rounded corners
        borderSide: const BorderSide(color: Colors.teal), // Focused border color
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8), // Rounded corners
        borderSide: const BorderSide(color: Colors.grey), // Border when the field is enabled but not focused
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8), // Rounded corners
        borderSide: const BorderSide(color: Colors.red), // Border color for errors
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8), // Rounded corners
        borderSide: const BorderSide(color: Colors.red), // Border color when error is focused
      ),
    ),
    iconTheme: const IconThemeData(
      color: Colors.teal,
      size: 24,
    ),
    cardTheme: const CardTheme(
      color: Colors.white, // Card color
      shadowColor: Colors.black26, // Light shadow
      elevation: 4, // Card elevation for shadows
      margin: EdgeInsets.all(8), // Margin around the card
    ),
    dividerTheme: const DividerThemeData(
      color: Colors.black12, // Divider color
      space: 8, // Space between elements with divider
      thickness: 1, // Thickness of the divider
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.teal,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.teal,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    textTheme: TextTheme(
      bodyLarge: const TextStyle(color: Colors.white, fontSize: 18),
      bodyMedium: const TextStyle(color: Colors.white54, fontSize: 16),
      bodySmall: TextStyle(color: Colors.white, fontSize: 14),
      headlineLarge: const TextStyle(color: Colors.teal, fontSize: 32, fontWeight: FontWeight.bold),
      headlineMedium: const TextStyle(color: Colors.teal, fontSize: 24, fontWeight: FontWeight.w600),
      headlineSmall: const TextStyle(color: Colors.teal, fontSize: 20, fontWeight: FontWeight.w500),
      titleLarge: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
      titleMedium: const TextStyle(color: Colors.white70, fontSize: 18, fontWeight: FontWeight.w400),
      titleSmall: const TextStyle(color: Colors.white54, fontSize: 16),
      labelLarge: const TextStyle(color: Colors.teal, fontSize: 14),
      labelMedium: const TextStyle(color: Colors.white, fontSize: 12),
      labelSmall: const TextStyle(color: Colors.white54, fontSize: 10),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.teal,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.teal, // Text color for TextButton
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.teal, side: const BorderSide(color: Colors.teal), // Border color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Rounded corners
        ),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Colors.teal, // Color for selected item
      unselectedItemColor: Colors.grey, // Color for unselected item
      type: BottomNavigationBarType.fixed, // Fixed type for consistent look
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true, // Whether the input field has a background color
      fillColor: Colors.grey.shade200, // Background color of the input field
      contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16), // Padding inside the input field
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8), // Rounded corners
        borderSide: BorderSide.none, // No border line when idle
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8), // Rounded corners
        borderSide: const BorderSide(color: Colors.teal), // Focused border color
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8), // Rounded corners
        borderSide: const BorderSide(color: Colors.grey), // Border when the field is enabled but not focused
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8), // Rounded corners
        borderSide: const BorderSide(color: Colors.red), // Border color for errors
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8), // Rounded corners
        borderSide: const BorderSide(color: Colors.red), // Border color when error is focused
      ),
    ),
    iconTheme: const IconThemeData(
      color: Colors.teal, // Default color for icons
      size: 24, // Default size for icons
    ),
    cardTheme: const CardTheme(
      color: Colors.white, // Card color
      shadowColor: Colors.black26, // Light shadow
      elevation: 4, // Card elevation for shadows
      margin: EdgeInsets.all(8), // Margin around the card
    ),
    dividerTheme: const DividerThemeData(
      color: Colors.black12, // Divider color
      space: 8, // Space between elements with divider
      thickness: 1, // Thickness of the divider
    ),
  );
}
