import 'package:flutter/material.dart';
import 'package:omedia/src/core/enums/enums.dart';
import 'package:omedia/src/ui/widgets/widgets.dart';
import 'package:ui_kit/ui_kit.dart';

class PaymentInfo extends StatelessWidget {
  const PaymentInfo.gold({super.key, required this.subTitle, this.trailing})
    : paymentType = PaymentType.gold,
      title = 'ოქროს ლომბარდი';
  const PaymentInfo.other({super.key, required this.subTitle, this.trailing})
    : paymentType = PaymentType.other,
      title = 'სხვა სესხები';

  final PaymentType paymentType;
  final String title;
  final Widget subTitle;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16).copyWith(bottom: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'სანამ გადაიხდი',
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(color: AppColors.black),
                ),
                Text(
                  'გაეცანი და დაეთანხმე, როგორ გადანაწილდება შენ მიერ გადახდილი თანხა',
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.grayVeryLight,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: CustomListTile.info(
              leading: AppIconButton.regular(
                buttonColor: (
                  backgroundColor: AppColors.primaryLight,
                  borderColor: null,
                ),
                icon: (
                  asset: paymentType == PaymentType.gold
                      ? Assets.gold
                      : Assets.currency,
                  size: 32,
                ),
                onPressed: () {},
              ),
              title: Text(
                'სხვა სესხები',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: AppColors.black,
                  fontSize: 13,
                ),
              ),
              subTitle: subTitle,
              trailing: trailing,
            ),
          ),
        ],
      ),
    );
  }
}
