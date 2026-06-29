import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../utils/date_utils.dart';
/// Greeting header with today's formatted date.
class GreetingHeader extends StatelessWidget {
  const GreetingHeader({
    super.key,
    required this.greeting,
    required this.today,
  });

  final String greeting;
  final DateTime today;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          greeting,
          style: textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          'Namaste 🙏',
          style: textTheme.bodyLarge?.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Row(
          children: [
            Icon(
              Icons.calendar_today_rounded,
              size: 16,
              color: AppColors.primary.withValues(alpha: 0.8),
            ),
            const SizedBox(width: AppSpacing.sm),
            Text(
              AppDateUtils.formatFullDate(today),              style: textTheme.titleSmall?.copyWith(
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
