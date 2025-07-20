import 'package:equatable/equatable.dart';

class LoanOtherModel extends Equatable {
  final String accountNumber;
  final double principalDue;
  final double interestDue;
  final double penalty;
  final double sumAmount;
  final String description;
  final String repaymentDate;
  final String currency;
  final double openingBalance;
  final int arrearsDays;
  final String issueDate;
  final double issueAmount;
  final double? effectiveIntRate;
  final double issueFeeAmount;

  const LoanOtherModel({
    required this.accountNumber,
    required this.principalDue,
    required this.interestDue,
    required this.penalty,
    required this.sumAmount,
    required this.description,
    required this.repaymentDate,
    required this.currency,
    required this.openingBalance,
    required this.arrearsDays,
    required this.issueDate,
    required this.issueAmount,
    this.effectiveIntRate,
    required this.issueFeeAmount,
  });

  factory LoanOtherModel.fromJson(Map<String, dynamic> json) {
    return LoanOtherModel(
      accountNumber: json['account_number'] as String,
      principalDue: (json['principalDue'] as num).toDouble(),
      interestDue: (json['interestDue'] as num).toDouble(),
      penalty: (json['penalty'] as num).toDouble(),
      sumAmount: (json['sum_amount'] as num).toDouble(),
      description: json['description'] as String,
      repaymentDate: json['repayment_date'] as String,
      currency: json['currency'] as String,
      openingBalance: (json['openingBalance'] as num).toDouble(),
      arrearsDays: json['arrearsDays'] as int,
      issueDate: json['IssueDate'] as String,
      issueAmount: (json['IssueAmount'] as num).toDouble(),
      effectiveIntRate: json['effective_int_Rate'] != null
          ? (json['effective_int_Rate'] as num).toDouble()
          : null,
      issueFeeAmount: (json['issue_fee_amount'] as num).toDouble(),
    );
  }

  @override
  List<Object?> get props => [
    accountNumber,
    principalDue,
    interestDue,
    penalty,
    sumAmount,
    description,
    repaymentDate,
    currency,
    openingBalance,
    arrearsDays,
    issueDate,
    issueAmount,
    effectiveIntRate,
    issueFeeAmount,
  ];
}
