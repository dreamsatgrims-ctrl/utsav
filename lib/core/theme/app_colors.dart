import 'package:flutter/material.dart';

/// Premium Hindu-inspired color palette for UTSAV.
abstract final class AppColors {
  /// Primary Saffron — main brand and CTAs.
  static const Color primary = Color(0xFFE76F00);

  /// Deep Orange — secondary accents and gradients.
  static const Color secondary = Color(0xFFE65100);

  /// Warm cream background.
  static const Color background = Color(0xFFFFF8F1);

  /// Card and elevated surface white.
  static const Color surface = Color(0xFFFFFFFF);

  /// Success states and positive indicators.
  static const Color success = Color(0xFF2E7D32);

  /// Error states and destructive actions.
  static const Color error = Color(0xFFD32F2F);

  /// Primary text on light surfaces.
  static const Color textPrimary = Color(0xFF1A1A1A);

  /// Secondary and hint text.
  static const Color textSecondary = Color(0xFF6B6B6B);

  /// Text and icons on primary-colored surfaces.
  static const Color onPrimary = Color(0xFFFFFFFF);

  /// Subtle borders and dividers.
  static const Color divider = Color(0xFFF0E4D6);

  /// Light saffron wash for selected states.
  static const Color primaryContainer = Color(0xFFFFEDD5);

  /// Soft orange wash for secondary containers.
  static const Color secondaryContainer = Color(0xFFFFE0B2);

  /// Gradient for hero cards.
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, secondary],
  );
}
