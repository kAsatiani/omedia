import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Add this import
import 'package:ui_kit/themes/app_colors.dart';
import 'package:ui_kit/themes/text_styles.dart';

class CurrencyFormatter extends StatefulWidget {
  const CurrencyFormatter({
    super.key,
    required this.amount,
    this.forceDecimalPlaces,
    this.amountStyle,
    this.currencyStyle,
  });

  final double amount;
  final int? forceDecimalPlaces;
  final TextStyle? amountStyle;
  final TextStyle? currencyStyle;

  @override
  State<CurrencyFormatter> createState() => _CurrencyFormatterState();
}

class _CurrencyFormatterState extends State<CurrencyFormatter> {
  int _getDecimalPlaces(double amount) {
    String amountStr = amount.toString();
    if (!amountStr.contains('.')) return 0;
    String decimalPart = amountStr.split('.')[1];
    decimalPart = decimalPart.replaceAll(RegExp(r'0+$'), '');
    return decimalPart.length;
  }

  String _formatGel(double amount, {int? forceDecimalPlaces}) {
    NumberFormat formatter;

    if (forceDecimalPlaces != null) {
      formatter = NumberFormat('#,##0.${'0' * forceDecimalPlaces}');
    } else {
      int decimalPlaces = _getDecimalPlaces(amount);
      if (decimalPlaces == 0) {
        formatter = NumberFormat('#,##0.00');
      } else {
        formatter = NumberFormat('#,##0.${'0' * decimalPlaces}');
      }
    }

    return formatter.format(amount);
  }

  @override
  Widget build(BuildContext context) {
    final formattedText = _formatGel(
      widget.amount,
      forceDecimalPlaces: widget.forceDecimalPlaces,
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          formattedText,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style:
              widget.amountStyle ??
              TextStyles.medium.copyWith(fontSize: 20, color: AppColors.black),
        ),
        const SizedBox(width: 4),
        Text(
          'd',
          style:
              widget.currencyStyle ??
              TextStyles.currency.copyWith(fontSize: 20),
        ),
      ],
    );
  }
}
