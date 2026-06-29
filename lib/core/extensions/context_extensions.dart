import 'package:flutter/material.dart';

import '../theme/app_spacing.dart';
import '../theme/app_theme_extensions.dart';

/// Convenience accessors for theme, spacing, and layout on [BuildContext].
extension ContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => theme.colorScheme;
  TextTheme get textTheme => theme.textTheme;

  AppThemeExtension get appTheme =>
      theme.extension<AppThemeExtension>() ?? AppThemeExtension.light;

  EdgeInsets get screenPadding => EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(this).width > 600
            ? AppSpacing.xl
            : AppSpacing.md,
      );

  double get bottomNavInset =>
      AppSpacing.xxl + MediaQuery.paddingOf(this).bottom;
}
