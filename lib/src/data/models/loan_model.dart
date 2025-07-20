import 'package:equatable/equatable.dart';

class LoanModel extends Equatable {
  final String accountNumber;
  final double issueAmount;
  final double principalAmount;
  final String issueDate;
  final double paymentAmount;
  final String paymentDate;
  final String currency;
  final double percRate;
  final double effectiveIntRate;
  final double monthPay30;
  final double monthPay31;
  final double monthPay;
  final int fineDay;
  final double fineAmount;
  final bool hasGraphic;
  final double finePerc;
  final int duration;
  final double? percRatePromotion;
  final double? secondMonthPay30;
  final double? secondMonthPay31;
  final double percAmount;
  final double fineAmountTotal;

  const LoanModel({
    required this.accountNumber,
    required this.issueAmount,
    required this.principalAmount,
    required this.issueDate,
    required this.paymentAmount,
    required this.paymentDate,
    required this.currency,
    required this.percRate,
    required this.effectiveIntRate,
    required this.monthPay30,
    required this.monthPay31,
    required this.monthPay,
    required this.fineDay,
    required this.fineAmount,
    required this.hasGraphic,
    required this.finePerc,
    required this.duration,
    this.percRatePromotion,
    this.secondMonthPay30,
    this.secondMonthPay31,
    required this.percAmount,
    required this.fineAmountTotal,
  });

  factory LoanModel.fromJson(Map<String, dynamic> json) {
    return LoanModel(
      accountNumber: json['account_number'] as String,
      issueAmount: (json['issue_amount'] as num).toDouble(),
      principalAmount: (json['principal_amount'] as num).toDouble(),
      issueDate: json['issue_date'] as String,
      paymentAmount: (json['payment_amount'] as num).toDouble(),
      paymentDate: json['payment_date'] as String,
      currency: json['currency'] as String,
      percRate: (json['perc_rate'] as num).toDouble(),
      effectiveIntRate: (json['effective_int_Rate'] as num).toDouble(),
      monthPay30: (json['month_pay_30'] as num).toDouble(),
      monthPay31: (json['month_pay_31'] as num).toDouble(),
      monthPay: (json['month_pay'] as num).toDouble(),
      fineDay: json['fineDay'] as int,
      fineAmount: (json['fineAmount'] as num).toDouble(),
      hasGraphic: json['has_graphic'] as bool,
      finePerc: (json['fine_perc'] as num).toDouble(),
      duration: json['duration'] as int,
      percRatePromotion: json['perc_rate_promotion'] != null
          ? (json['perc_rate_promotion'] as num).toDouble()
          : null,
      secondMonthPay30: json['second_month_pay30'] != null
          ? (json['second_month_pay30'] as num).toDouble()
          : null,
      secondMonthPay31: json['second_month_pay31'] != null
          ? (json['second_month_pay31'] as num).toDouble()
          : null,
      percAmount: (json['perc_amount'] as num).toDouble(),
      fineAmountTotal: (json['fine_amount'] as num).toDouble(),
    );
  }

  @override
  List<Object?> get props => [
    accountNumber,
    issueAmount,
    principalAmount,
    issueDate,
    paymentAmount,
    paymentDate,
    currency,
    percRate,
    effectiveIntRate,
    monthPay30,
    monthPay31,
    monthPay,
    fineDay,
    fineAmount,
    hasGraphic,
    finePerc,
    duration,
    percRatePromotion,
    secondMonthPay30,
    secondMonthPay31,
    percAmount,
    fineAmountTotal,
  ];
}
