import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class CustomPaymentText extends StatelessWidget {
  const CustomPaymentText({
    super.key,
    required this.dates,
    required this.remainingDays,
  });
  final ({bool isExpired, bool isToday}) dates;
  final int remainingDays;
  @override
  Widget build(BuildContext context) {
    const WidgetSpan gap = WidgetSpan(child: SizedBox(width: 5));
    if (dates.isToday || remainingDays == 0) {
      return RichText(
        text: TextSpan(
          text: 'გადახდა',
          style: TextStyles.labelMedium.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.grayDark,
          ),
          children: [
            gap,
            TextSpan(
              text: 'დღეს',
              style: TextStyles.labelMedium.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.grayDark,
              ),
            ),
          ],
        ),
      );
    }

    if (dates.isExpired || remainingDays < 0) {
      return RichText(
        text: TextSpan(
          text: 'გადაცილება',
          style: TextStyles.labelMedium.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.primary,
          ),
          children: [
            gap,
            TextSpan(
              text: '$remainingDays დღე',
              style: TextStyles.labelMedium.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.error,
              ),
            ),
          ],
        ),
      );
    }
    return RichText(
      text: TextSpan(
        text: 'გადახდა',
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          fontWeight: FontWeight.w400,
          color: AppColors.grayDark,
        ),
        children: [
          gap,
          TextSpan(
            text: '$remainingDays დღეში',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.grayDark,
            ),
          ),
        ],
      ),
    );
  }
}
