import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:omedia/src/bloc/obligations_bloc.dart';
import 'package:omedia/src/data/models/upcoming_item_model.dart';
import 'package:omedia/src/ui/widgets/widgets.dart';
import 'package:ui_kit/shared/shared.dart';
import 'package:ui_kit/themes/app_colors.dart';
import 'package:ui_kit/themes/text_styles.dart';

import 'widgets.dart';

class GoldLoanDetails extends StatelessWidget {
  const GoldLoanDetails({super.key, required this.selectedGoldIndex});
  final int selectedGoldIndex;

  @override
  Widget build(BuildContext context) {
    final UpcomingItemModel? selectedGold = context.select(
      (ObligationsBloc bloc) =>
          bloc.state.obligationsGold?.upcoming.items[selectedGoldIndex],
    );
    if (selectedGold == null) {
      return const Center(
        child: CircularProgressIndicator(color: AppColors.primary),
      );
    }

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: PaymentInfo.gold(
            subTitle: CustomPaymentText(
              dates: (
                isExpired: selectedGold.expired,
                isToday: selectedGold.today,
              ),
              remainingDays: selectedGold.remainingDays,
            ),
          ),
        ),
        SliverToBoxAdapter(child: WarningText()),

        SliverFillRemaining(child: _Details(selectedGold: selectedGold)),
      ],
    );
  }
}

class _Details extends StatelessWidget {
  const _Details({required this.selectedGold});

  final UpcomingItemModel selectedGold;

  @override
  Widget build(BuildContext context) {
    final style = (
      currencyStyle: TextStyles.currency.copyWith(fontSize: 16),
      amountStyle: TextStyles.titleSmall,
    );

    final labelStyle = TextStyles.bodySmall.copyWith(
      color: AppColors.grayDark,
      fontSize: 13,
    );

    final paymentDate = DateFormat(
      'dd/MM/yyyy',
    ).format(DateTime.parse(selectedGold.paymentDate));

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text('გადახდის თარიღი', style: labelStyle),
              const Spacer(),
              Text(paymentDate, style: TextStyles.bodyMedium),
            ],
          ),
          8.height,
          Divider(color: AppColors.grayLight, height: 1),
          10.height,
          Row(
            children: [
              Text('გადასახდელი თანხა', style: labelStyle),
              const Spacer(),
              CurrencyFormatter(
                amount: selectedGold.paymentAmount,
                amountStyle: style.amountStyle,
                currencyStyle: style.currencyStyle,
              ),
            ],
          ),
          10.height,
          Divider(color: AppColors.grayLight, height: 1),
          8.height,
          Row(
            children: [
              Text('ძირი', style: labelStyle),
              const Spacer(),
              CurrencyFormatter(
                amountStyle: style.amountStyle.copyWith(fontSize: 13),
                currencyStyle: style.currencyStyle.copyWith(fontSize: 14),
                amount: selectedGold.principalAmount,
              ),
            ],
          ),
          8.height,
          Row(
            children: [
              Text('პროცენტი', style: labelStyle),
              const Spacer(),
              CurrencyFormatter(
                amountStyle: style.amountStyle.copyWith(fontSize: 13),
                currencyStyle: style.currencyStyle.copyWith(fontSize: 14),
                amount: selectedGold.percentageAmount,
              ),
            ],
          ),
          8.height,
          Row(
            children: [
              Text('ჯარიმა', style: labelStyle),
              const Spacer(),
              CurrencyFormatter(
                amountStyle: style.amountStyle.copyWith(fontSize: 13),
                currencyStyle: style.currencyStyle.copyWith(fontSize: 14),
                amount: selectedGold.fineAmount,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
