import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omedia/src/bloc/obligations_bloc.dart';
import 'package:omedia/src/ui/widgets/currency_formatter.dart';
import 'package:ui_kit/shared/shared.dart';
import 'package:ui_kit/themes/text_styles.dart';
import 'package:ui_kit/themes/themes.dart';

class TotalBalance extends StatefulWidget {
  const TotalBalance({super.key});

  @override
  State<TotalBalance> createState() => _TotalBalanceState();
}

class _TotalBalanceState extends State<TotalBalance> {
  @override
  Widget build(BuildContext context) {
    const text = '''
ცნობილი ფაქტია, რომ გვერდის წაკითხვად შიგთავსს შეუძლია მკითხველის ყურადღება მიიზიდოს და დიზაინის აღქმაში ხელი შეუშალოს.
''';
    return SliverToBoxAdapter(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.grayVeryLight,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'ხელმისაწვდომი თანხა',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  child:
                      BlocSelector<ObligationsBloc, ObligationsState, double?>(
                        selector: (state) {
                          return state.obligationsOther?.transitBalance;
                        },
                        builder: (context, state) {
                          return CurrencyFormatter(
                            amount: state ?? 0.0,
                            amountStyle: Theme.of(context).textTheme.titleSmall,
                            currencyStyle: TextStyles.currency.copyWith(
                              fontSize: 14,
                            ),
                          );
                        },
                      ),
                ),
              ],
            ),
            6.height,
            Text(
              text,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(
                context,
              ).textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
