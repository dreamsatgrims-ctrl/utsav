import 'package:flutter/material.dart';

import '../../core/theme/app_durations.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radius.dart';
import '../../core/theme/app_spacing.dart';

/// Elevated surface card with optional tap handling and custom child content.
class PrimaryCard extends StatelessWidget {
  const PrimaryCard({
    super.key,
    required this.child,
    this.onTap,
    this.padding,
    this.margin,
    this.gradient,
    this.borderColor,
    this.backgroundColor,
    this.elevation = 0,
  });

  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Gradient? gradient;
  final Color? borderColor;
  final Color? backgroundColor;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    final card = AnimatedContainer(
      duration: AppDurations.normal,
      margin: margin,
      decoration: BoxDecoration(
        gradient: gradient,
        color: gradient == null ? (backgroundColor ?? AppColors.surface) : null,
        borderRadius: AppRadius.largeBorder,
        border: Border.all(
          color: borderColor ?? AppColors.divider,
        ),
        boxShadow: elevation > 0
            ? [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.08),
                  blurRadius: elevation * 4,
                  offset: Offset(0, elevation),
                ),
              ]
            : null,
      ),
      child: Padding(
        padding: padding ?? const EdgeInsets.all(AppSpacing.md),
        child: child,
      ),
    );

    if (onTap == null) return card;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: AppRadius.largeBorder,
        child: card,
      ),
    );
  }
}
