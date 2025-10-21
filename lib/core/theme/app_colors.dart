import 'package:flutter/material.dart';

class AppColors {
  // Primary Branding - Updated to match image description
  static const Color primary = Color(0xFF1E8E3E); // Dark green from image
  static const Color secondary = Color(0xFF2D9E51);
  static const Color accent = Color(0xFF3B58F7);

  // Backgrounds - Updated to match image description
  static const Color background = Color(0xFF052C18);
  static const Color backgroundLight = Color(
    0xFFF7F8FA,
  ); // Light grey from image
  static const Color surface = Color(0xFF1C8537);

  // Additional colors from image description
  static const Color searchBarBackground = Color(
    0xFFE8EFE9,
  ); // Light green-grey for search bar
  static const Color cardBackground = Color(0xFFFFFFFF); // White for cards
  static const Color textSecondary = Color(
    0xFF667085,
  ); // Grey for secondary text

  // Text - Updated to match image description
  static const Color textPrimary = Color(
    0xFF111111,
  ); // Dark black for main text
  static const Color textAccent = accent;

  // Buttons and UI
  static const Color button = secondary;
  static const Color error = Color(0xFFEF4444);
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color info = Color(0xFF3B82F6);

  // basic
  static const Color white = Colors.white;
  static const Color whiteGray = Color(0xfff5f5f5);
  static const Color black = Colors.black;
  static final Color greyDark = Colors.grey[800] ?? Colors.grey;
  static final Color greyLight = Colors.grey[300] ?? Colors.grey;
  static final Color grey = Colors.grey;

  // Border colors
  static const Color border = Color(0xFFE5E7EB);

  // Material Design 3 colors
  static const Color onPrimary = Colors.white;
  static const Color onSurface = Color(0xFF1C1B1F);
  static const Color onSurfaceVariant = Color(0xFF49454F);
}
