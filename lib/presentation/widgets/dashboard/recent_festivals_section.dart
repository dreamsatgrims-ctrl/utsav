import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../utils/date_utils.dart';
import '../../../data/models/festival_model.dart';
import '../primary_card.dart';

/// Horizontal list of recently observed festivals.
class RecentFestivalsSection extends StatelessWidget {
  const RecentFestivalsSection({
    super.key,
    required this.festivals,
  });

  final List<FestivalModel> festivals;

  @override
  Widget build(BuildContext context) {
    if (festivals.isEmpty) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      height: 130,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: festivals.length,
        separatorBuilder: (_, _) => const SizedBox(width: AppSpacing.sm),
        itemBuilder: (context, index) {
          return _FestivalListItem(festival: festivals[index]);
        },
      ),
    );
  }
}

class _FestivalListItem extends StatelessWidget {
  const _FestivalListItem({required this.festival});

  final FestivalModel festival;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final formattedDate = AppDateUtils.formatShortDate(festival.date);

    return SizedBox(
      width: 220,
      child: PrimaryCard(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              formattedDate,
              style: textTheme.labelMedium?.copyWith(
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              festival.name,
              style: textTheme.titleSmall,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            Text(
              festival.description,
              style: textTheme.bodySmall,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
