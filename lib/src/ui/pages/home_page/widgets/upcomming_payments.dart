import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omedia/src/bloc/obligations_bloc.dart';
import 'package:omedia/src/ui/pages/home_page/widgets/bottom_sheet_widget.dart';
import 'package:omedia/src/ui/pages/payment_details_page/payment_details_page.dart';
import 'package:omedia/src/ui/pages/pdf_screen/pdf_screen.dart';
import 'package:omedia/src/ui/widgets/widgets.dart';
import 'package:ui_kit/shared/shared.dart';

import 'package:ui_kit/ui_kit.dart';

class UpcommingPayments extends StatefulWidget {
  const UpcommingPayments({super.key});

  @override
  State<UpcommingPayments> createState() => _UpcommingPaymentsState();
}

class _UpcommingPaymentsState extends State<UpcommingPayments> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'მოახლოებული გადახდები',
              style: TextStyles.titleMedium.copyWith(color: AppColors.black),
            ),
            12.height,
            _ListTiles(),
          ],
        ),
      ),
    );
  }
}

class _ListTiles extends StatelessWidget {
  const _ListTiles();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ObligationsBloc, ObligationsState>(
      builder: (context, state) {
        return Column(
          children: [
            CustomListTile.listTile(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PaymentDetailsPage.other(),
                  ),
                );
              },
              leading: CustomBackground(child: AppIcon(Assets.currency)),
              title: Text('სხვა სესხები', style: TextStyles.labelMedium),
              subTitle: state.obligationsOther?.upcoming == null
                  ? null
                  : CustomPaymentText(
                      dates: (
                        isExpired:
                            state.obligationsOther?.upcoming.expired ?? false,
                        isToday:
                            state.obligationsOther?.upcoming.today ?? false,
                      ),
                      remainingDays:
                          state.obligationsOther?.upcoming.remainingDays ?? 0,
                    ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CurrencyFormatter(
                    amount: state.obligationsOther?.upcoming.paymentAmount ?? 0,
                    amountStyle: TextStyles.medium.copyWith(
                      fontSize: 14,
                      color: AppColors.black,
                    ),
                    currencyStyle: TextStyles.currency.copyWith(
                      fontSize: 14,
                      color: AppColors.grayMedium,
                    ),
                  ),
                  6.width,
                  AppIcon(Assets.arrowRight, width: 20, height: 20),
                ],
              ),
            ),
            12.height,
            CustomListTile.listTile(
              onPressed: () {
                showModalBottomSheet(
                  backgroundColor: Colors.white,
                  context: context,
                  builder: (ctx) {
                    return BottomSheetWidget();
                  },
                );
              },
              leading: CustomBackground(
                positionedChildren: [
                  Positioned(
                    top: 0,
                    right: 0,
                    child: AppIcon(
                      Assets.error,
                      width: 15,
                      height: 15,
                      color: AppColors.error,
                    ),
                  ),
                ],
                child: AppIcon(Assets.gold),
              ),
              title: Text(
                'ოქროს ლომბარდი',
                style: Theme.of(
                  context,
                ).textTheme.labelMedium?.copyWith(color: AppColors.black),
              ),
              subTitle: CustomPaymentText(
                dates: (
                  isExpired: state.obligationsGold?.upcoming.expired ?? false,
                  isToday: state.obligationsGold?.upcoming.today ?? false,
                ),
                remainingDays:
                    state.obligationsGold?.upcoming.remainingDays ?? 0,
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CurrencyFormatter(
                    amount: state.obligationsGold?.upcoming.paymentAmount ?? 0,
                    amountStyle: TextStyles.medium.copyWith(
                      fontSize: 14,
                      color: AppColors.black,
                    ),
                    currencyStyle: TextStyles.currency.copyWith(
                      fontSize: 14,
                      color: AppColors.grayMedium,
                    ),
                  ),
                  6.width,
                  AppIcon(Assets.arrowRight, width: 20, height: 20),
                ],
              ),
            ),
            16.height,
            AppButton.primaryLight(
              label: 'ამონაწერის მომზადება',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PdfScreen()),
                );
              },
              icon: (icon: Assets.list, color: AppColors.primaryDark),
            ),
          ],
        );
      },
    );
  }
}
