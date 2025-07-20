import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omedia/src/bloc/obligations_bloc.dart';
import 'package:omedia/src/data/models/models.dart';
import 'package:omedia/src/ui/pages/payment_details_page/payment_details_page.dart';
import 'package:omedia/src/ui/widgets/widgets.dart';
import 'package:ui_kit/ui_kit.dart';

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({super.key});

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  int? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 20,
              ).copyWith(bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'აირჩიე რისი გადახდა გსურს',
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium?.copyWith(color: AppColors.black),
                  ),
                  AppIconButton.circular(
                    icon: (asset: Assets.close, size: 24),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            Divider(color: AppColors.grayLight),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              child:
                  BlocSelector<
                    ObligationsBloc,
                    ObligationsState,
                    UpcomingModel?
                  >(
                    selector: (state) {
                      return state.obligationsGold?.upcoming;
                    },
                    builder: (context, upcoming) {
                      if (upcoming == null) {
                        return const SizedBox.shrink();
                      }
                      return Column(
                        children: [
                          for (final (index, item) in upcoming.items.indexed)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: CustomListTile<int?>.radio(
                                subTitle: CustomPaymentText(
                                  dates: (
                                    isExpired: upcoming.expired,
                                    isToday: upcoming.today,
                                  ),
                                  remainingDays: upcoming.remainingDays,
                                ),
                                title: Text(
                                  'ოქროს ლომბარდი',
                                  style: TextStyles.titleSmall.copyWith(
                                    color: AppColors.black,
                                  ),
                                ),
                                trailing: CurrencyFormatter(
                                  amount: item.paymentAmount,
                                  amountStyle: TextStyles.titleSmall.copyWith(
                                    color: AppColors.black,
                                    fontSize: 16,
                                  ),
                                  currencyStyle: TextStyles.currency.copyWith(
                                    color: AppColors.black,
                                    fontSize: 16,
                                  ),
                                ),
                                value: index,
                                groupValue: selectedOption,
                                onChanged: (int? value) {
                                  setState(() {
                                    selectedOption = value;
                                  });
                                },
                              ),
                            ),
                        ],
                      );
                    },
                  ),
            ),
          ],
        ),
        Container(
          color: AppColors.grayLight,
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 20,
          ).copyWith(bottom: 30),
          child: AppButton.text(
            label: 'დავალიანების არჩევა',
            onPressed: selectedOption != null
                ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentDetailsPage.gold(
                          selectedGoldIndex: selectedOption,
                        ),
                      ),
                    );
                  }
                : null,
            buttonStyle: AppButtonStyle.getStyle(context, AppButtonType.text)
                .copyWith(
                  backgroundColor: WidgetStateProperty.resolveWith<Color>((
                    states,
                  ) {
                    if (states.contains(WidgetState.disabled)) {
                      return AppColors.primary.withAlpha(90);
                    }
                    return AppColors.primary;
                  }),
                ),
          ),
        ),
      ],
    );
  }
}
