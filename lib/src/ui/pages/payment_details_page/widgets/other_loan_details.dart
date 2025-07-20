import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:omedia/src/bloc/obligations_bloc.dart';
import 'package:omedia/src/data/models/models.dart';
import 'package:omedia/src/ui/widgets/widgets.dart';
import 'package:ui_kit/ui_kit.dart';
import 'widgets.dart';

class OtherLoanDetails extends StatefulWidget {
  const OtherLoanDetails({super.key});

  @override
  State<OtherLoanDetails> createState() => _OtherLoanDetailsState();
}

class _OtherLoanDetailsState extends State<OtherLoanDetails>
    with TickerProviderStateMixin {
  int expandedIndex = -1;
  late AnimationController _animationController;
  late Animation<double> _heightAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _heightAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleExpanded(int index) {
    setState(() {
      if (expandedIndex == index) {
        expandedIndex = -1;
        _animationController.reverse();
      } else {
        expandedIndex = index;
        _animationController.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final upcomingItems = context.select(
      (ObligationsBloc bloc) => bloc.state.obligationsOther?.upcoming.items,
    );

    if (upcomingItems == null) {
      return const Center(
        child: CircularProgressIndicator(color: AppColors.primary),
      );
    }

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: PaymentInfo.other(
            trailing: CurrencyFormatter(
              amount: upcomingItems.first.paymentAmount,
              amountStyle: TextStyles.titleSmall.copyWith(
                color: AppColors.black,
              ),
              currencyStyle: TextStyles.currency.copyWith(
                color: AppColors.grayMedium,
                fontSize: 16,
              ),
            ),
            subTitle: CustomPaymentText(
              dates: (
                isExpired: upcomingItems.first.expired,
                isToday: upcomingItems.first.today,
              ),
              remainingDays: upcomingItems.first.remainingDays,
            ),
          ),
        ),
        SliverToBoxAdapter(child: WarningText()),
        SliverToBoxAdapter(
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Column(
              children: [
                for (final (index, e) in upcomingItems.indexed)
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(
                          color: AppColors.grayLight,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Column(
                      children: [
                        CustomListTile.listTile(
                          elevation: 0,
                          onPressed: () => _toggleExpanded(index),
                          backgroundColor: Colors.white,
                          leading: CustomBackground(
                            color: AppColors.primaryLight,
                            child: AppIcon(Assets.currency),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CurrencyFormatter(
                                amount: e.paymentAmount,
                                amountStyle: TextStyles.titleSmall.copyWith(
                                  color: AppColors.black,
                                ),
                                currencyStyle: TextStyles.currency.copyWith(
                                  color: AppColors.grayMedium,
                                  fontSize: 16,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 6),
                                child: AnimatedRotation(
                                  turns: expandedIndex == index ? 0.5 : 0,
                                  duration: const Duration(milliseconds: 200),
                                  child: AppIcon(
                                    Assets.arrowDown,
                                    color: expandedIndex == index
                                        ? AppColors.primary
                                        : AppColors.grayMedium,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          title: Text(
                            'იპოთეკური სესხი',
                            style: TextStyles.labelMedium,
                          ),
                          subTitle: Text(
                            DateFormat(
                              'dd/MM/yyyy',
                            ).format(DateTime.parse(e.paymentDate)),
                            style: TextStyles.bodySmall.copyWith(
                              color: AppColors.grayDark,
                              fontSize: 11,
                            ),
                          ),
                        ),
                        AnimatedBuilder(
                          animation: _animationController,
                          builder: (context, child) {
                            final isExpanded = expandedIndex == index;
                            return AnimatedSize(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                              child: Align(
                                alignment: Alignment.topCenter,
                                heightFactor: isExpanded
                                    ? _heightAnimation.value
                                    : 0,
                                child: isExpanded ? child : const SizedBox(),
                              ),
                            );
                          },
                          child: LoanDetailWidget(
                            upcomingItem: e,
                            key: ValueKey(index),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class LoanDetailWidget extends StatelessWidget {
  const LoanDetailWidget({super.key, required this.upcomingItem});

  final UpcomingOtherItemModel upcomingItem;

  Widget _rowItem(String label, double amount) {
    final textStyle = TextStyles.bodySmall.copyWith(color: AppColors.grayDark);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('$label:', style: textStyle),
        CurrencyFormatter(
          amount: amount,
          amountStyle: TextStyles.titleSmall.copyWith(
            color: AppColors.black,
            fontSize: 13,
          ),
          currencyStyle: TextStyles.currency.copyWith(
            color: AppColors.grayMedium,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.grayVeryLight,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        children: [
          _rowItem('ძირი', upcomingItem.principalAmount),
          _rowItem('პროცენტი', upcomingItem.percentageAmount),
          _rowItem('ჯარიმა', upcomingItem.fineAmount),
        ],
      ),
    );
  }
}
