import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Custom theme tokens exposed via [Theme.of(context).extension].
@immutable
class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  const AppThemeExtension({
    required this.success,
    required this.background,
    required this.primaryGradient,
  });

  final Color success;
  final Color background;
  final LinearGradient primaryGradient;

  static const light = AppThemeExtension(
    success: AppColors.success,
    background: AppColors.background,
    primaryGradient: AppColors.primaryGradient,
  );

  @override
  AppThemeExtension copyWith({
    Color? success,
    Color? background,
    LinearGradient? primaryGradient,
  }) {
    return AppThemeExtension(
      success: success ?? this.success,
      background: background ?? this.background,
      primaryGradient: primaryGradient ?? this.primaryGradient,
    );
  }

  @override
  AppThemeExtension lerp(AppThemeExtension? other, double t) {
    if (other is! AppThemeExtension) return this;
    return AppThemeExtension(
      success: Color.lerp(success, other.success, t)!,
      background: Color.lerp(background, other.background, t)!,
      primaryGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color.lerp(
            primaryGradient.colors.first,
            other.primaryGradient.colors.first,
            t,
          )!,
          Color.lerp(
            primaryGradient.colors.last,
            other.primaryGradient.colors.last,
            t,
          )!,
        ],
      ),
    );
  }
}
