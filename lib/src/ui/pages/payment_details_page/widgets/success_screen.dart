import 'package:flutter/material.dart';
import 'package:omedia/src/ui/widgets/app_bar/custom_app_bar.dart';
import 'package:ui_kit/ui_kit.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.paymentAmount});
  final double paymentAmount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.success(),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        color: AppColors.grayLight,
        child: AppButton.primary(
          onPressed: () {
            Navigator.pop(context);
          },
          label: 'დახურვა',
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            decoration: BoxDecoration(
              color: AppColors.successLight,
              borderRadius: BorderRadius.circular(20),
            ),
            child: AppIcon(Assets.success, height: 48, width: 48),
          ),

          Text('გადახდა შესრულებულია', style: TextStyles.titleMedium),
          Padding(
            padding: const EdgeInsets.all(20.0).copyWith(left: 30, right: 30),
            child: Text.rich(
              style: TextStyles.bodySmall.copyWith(color: AppColors.grayDark),
              TextSpan(
                children: [
                  TextSpan(text: 'შენ წარმატებით გადაიხადე'),
                  TextSpan(
                    text: ' $paymentAmount',
                    style: TextStyles.labelMedium.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                  TextSpan(
                    text: 'd',
                    style: TextStyles.currency.copyWith(
                      color: AppColors.black,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(text: ' ოქროს ლომბარდის სესხზე'),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
