import 'package:flutter/material.dart';

/// Border radius tokens for cards, buttons, and navigation.
abstract final class AppRadius {
  static const double small = 8;
  static const double medium = 12;
  static const double large = 16;
  static const double xl = 24;
  static const double full = 999;

  static BorderRadius get smallBorder => BorderRadius.circular(small);
  static BorderRadius get mediumBorder => BorderRadius.circular(medium);
  static BorderRadius get largeBorder => BorderRadius.circular(large);
  static BorderRadius get xlBorder => BorderRadius.circular(xl);
}
