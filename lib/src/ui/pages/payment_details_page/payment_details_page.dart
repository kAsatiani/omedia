import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omedia/src/bloc/obligations_bloc.dart';
import 'package:omedia/src/core/enums/enums.dart';
import 'package:omedia/src/ui/pages/payment_details_page/widgets/other_loan_details.dart';
import 'package:omedia/src/ui/pages/payment_details_page/widgets/success_screen.dart';
import 'package:omedia/src/ui/widgets/app_bar/custom_app_bar.dart';
import 'package:ui_kit/ui_kit.dart';

import 'widgets/widgets.dart';

class PaymentDetailsPage extends StatelessWidget {
  const PaymentDetailsPage.gold({super.key, required this.selectedGoldIndex})
    : paymentType = PaymentType.gold;
  const PaymentDetailsPage.other({super.key})
    : selectedGoldIndex = null,
      paymentType = PaymentType.other;

  final int? selectedGoldIndex;
  final PaymentType paymentType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grayLight,
      appBar: const CustomAppBar.details(),
      body: paymentType == PaymentType.gold
          ? GoldLoanDetails(selectedGoldIndex: selectedGoldIndex!)
          : const OtherLoanDetails(),
      bottomNavigationBar: _buildBottomButton(context),
    );
  }

  Widget _buildBottomButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      color: AppColors.grayLight,
      child: AppButton.primary(
        label: 'შემდეგი',
        onPressed: () => _onNextPressed(context),
      ),
    );
  }

  void _onNextPressed(BuildContext context) {
    final bloc = context.read<ObligationsBloc>();
    final paymentAmount = paymentType == PaymentType.gold
        ? bloc
              .state
              .obligationsGold
              ?.upcoming
              .items[selectedGoldIndex!]
              .paymentAmount
        : bloc.state.obligationsOther?.upcoming.paymentAmount;

    showModalBottomSheet(
      context: context,
      builder: (_) => PaymentScreen(paymentAmount: paymentAmount ?? 0),
    );
  }
}

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key, required this.paymentAmount});

  final double paymentAmount;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late final TextEditingController _controller;
  bool isButtonEnabled = true;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.paymentAmount.toString());
    isButtonEnabled = _controller.text.trim().isNotEmpty;

    _controller.addListener(() {
      final isNotEmpty = _controller.text.trim().isNotEmpty;
      if (isButtonEnabled != isNotEmpty) {
        setState(() {
          isButtonEnabled = isNotEmpty;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.removeListener(() {});
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeader(context),
          const Divider(color: AppColors.grayLight, height: 1),
          _buildInfoText(),
          PaymentAmountInput(paymentAmountController: _controller),
          _buildPayButton(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 6),
      child: Row(
        children: [
          Text(
            'გადახდა',
            style: TextStyles.titleMedium.copyWith(color: AppColors.black),
          ),
          const Spacer(),
          AppIconButton.regular(
            icon: (asset: Assets.close, size: 24),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Text(
        'გაითვალისწინე, რომ სესხების თანხები დაიფარება პრიორიტეტის შესაბამისად',
        style: TextStyles.bodySmall.copyWith(color: AppColors.grayDark),
      ),
    );
  }

  Widget _buildPayButton(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.grayLight,
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
      child: AppButton.text(
        label: 'გადახდა',
        onPressed: isButtonEnabled
            ? () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        SuccessScreen(paymentAmount: widget.paymentAmount),
                  ),
                );
              }
            : null,
        buttonStyle: AppButtonStyle.getStyle(context, AppButtonType.text)
            .copyWith(
              backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
                if (states.contains(WidgetState.disabled)) {
                  return AppColors.primary.withAlpha(90);
                }
                return AppColors.primary;
              }),
            ),
      ),
    );
  }
}

class PaymentAmountInput extends StatelessWidget {
  const PaymentAmountInput({super.key, required this.paymentAmountController});

  final TextEditingController paymentAmountController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
      child: TextField(
        controller: paymentAmountController,
        onTapOutside: (_) => FocusScope.of(context).unfocus(),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}$')),
        ],
        decoration: InputDecoration(
          hintText: 'გადასახდელი თანხა',
          fillColor: AppColors.grayVeryLight,
          filled: true,
          suffix: Text('d', style: TextStyles.currency),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.grayLight),
            borderRadius: BorderRadius.circular(6),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.grayLight),
          ),
        ),
      ),
    );
  }
}
