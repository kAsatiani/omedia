import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omedia/src/bloc/obligations_bloc.dart';
import 'package:omedia/src/ui/widgets/currency_formatter.dart';
import 'package:ui_kit/themes/app_colors.dart';

class MyObligations extends StatefulWidget {
  const MyObligations({super.key});

  @override
  State<MyObligations> createState() => _MyObligationsState();
}

class _MyObligationsState extends State<MyObligations> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ჩემი ვალდებულებები',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.grayDark,
                fontWeight: FontWeight.w500,
              ),
            ),
            BlocSelector<ObligationsBloc, ObligationsState, double>(
              selector: (state) {
                return state.sumObligations();
              },
              builder: (context, state) {
                return CurrencyFormatter(amount: state);
              },
            ),
          ],
        ),
      ),
    );
  }
}
