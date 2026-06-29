import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../data/models/panchang_model.dart';
import '../primary_card.dart';

/// Hero card displaying today's Panchang details.
class PanchangCard extends StatelessWidget {
  const PanchangCard({
    super.key,
    required this.panchang,
  });

  final PanchangModel panchang;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return PrimaryCard(
      gradient: AppColors.primaryGradient,
      borderColor: Colors.transparent,
      padding: const EdgeInsets.all(AppSpacing.lg),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(AppSpacing.sm),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.wb_sunny_rounded,
                  color: AppColors.onPrimary,
                  size: 28,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Today's Panchang",
                      style: textTheme.titleLarge?.copyWith(
                        color: AppColors.onPrimary,
                      ),
                    ),
                    Text(
                      panchang.hinduMonth,
                      style: textTheme.bodyMedium?.copyWith(
                        color: AppColors.onPrimary.withValues(alpha: 0.85),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          _PanchangRow(label: 'Tithi', value: panchang.tithi),
          const SizedBox(height: AppSpacing.sm),
          _PanchangRow(label: 'Nakshatra', value: panchang.nakshatra),
          const SizedBox(height: AppSpacing.sm),
          _PanchangRow(label: 'Yoga', value: panchang.yoga),
          const SizedBox(height: AppSpacing.sm),
          _PanchangRow(label: 'Karana', value: panchang.karana),
        ],
      ),
    );
  }
}

class _PanchangRow extends StatelessWidget {
  const _PanchangRow({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 90,
          child: Text(
            label,
            style: textTheme.bodySmall?.copyWith(
              color: AppColors.onPrimary.withValues(alpha: 0.75),
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: textTheme.bodyMedium?.copyWith(
              color: AppColors.onPrimary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
