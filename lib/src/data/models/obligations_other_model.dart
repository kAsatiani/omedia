import 'package:equatable/equatable.dart';
import 'package:omedia/src/data/models/models.dart';

class ObligationsOtherModel extends Equatable {
  final String customerName;
  final String transitGEL;
  final double transitBalance;
  final double expense;
  final List<dynamic> expenseDetail;
  final double taxAmount;
  final List<LoanOtherModel> loans;
  final UpcomingOtherModel upcoming;

  const ObligationsOtherModel({
    required this.customerName,
    required this.transitGEL,
    required this.transitBalance,
    required this.expense,
    required this.expenseDetail,
    required this.taxAmount,
    required this.loans,
    required this.upcoming,
  });

  factory ObligationsOtherModel.fromJson(Map<String, dynamic> json) {
    return ObligationsOtherModel(
      customerName: json['customerName'] as String,
      transitGEL: json['transit_GEL'] as String,
      transitBalance: (json['transit_balance'] as num).toDouble(),
      expense: (json['expense'] as num).toDouble(),
      expenseDetail: json['expense_detail'] as List<dynamic>,
      taxAmount: (json['tax_amount'] as num).toDouble(),
      loans: (json['loans'] as List<dynamic>)
          .map((loan) => LoanOtherModel.fromJson(loan as Map<String, dynamic>))
          .toList(),
      upcoming: UpcomingOtherModel.fromJson(
        json['upcoming'] as Map<String, dynamic>,
      ),
    );
  }

  @override
  List<Object?> get props => [
    customerName,
    transitGEL,
    transitBalance,
    expense,
    expenseDetail,
    taxAmount,
    loans,
    upcoming,
  ];
}
