import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class WarningText extends StatelessWidget {
  const WarningText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        spacing: 10,
        children: [
          AppIcon(Assets.errorOutline),
          Flexible(
            child: Text.rich(
              maxLines: 3,
              TextSpan(
                children: [
                  TextSpan(
                    text:
                        'ბალანსით სესხის წინსწრებით დასაფარად, დაგვირეკე კონტაქტ ცენტრში: ',
                    style: TextStyles.bodySmall.copyWith(
                      color: AppColors.grayDark,
                    ),
                  ),
                  TextSpan(
                    text: '2 300 300',
                    style: TextStyles.bodySmall.copyWith(
                      color: AppColors.primaryDark,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
