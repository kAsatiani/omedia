import 'package:equatable/equatable.dart';
import 'package:omedia/src/data/models/models.dart';

class ObligationsGoldModel extends Equatable {
  final String customerName;
  final String phone;
  final double totalPayment;
  final List<LoanModel> loans;
  final UpcomingModel upcoming;

  const ObligationsGoldModel({
    required this.customerName,
    required this.phone,
    required this.totalPayment,
    required this.loans,
    required this.upcoming,
  });

  factory ObligationsGoldModel.fromJson(Map<String, dynamic> json) {
    return ObligationsGoldModel(
      customerName: json['customerName'] as String,
      phone: json['phone'] as String,
      totalPayment: (json['total_payment'] as num).toDouble(),
      loans: (json['loans'] as List<dynamic>)
          .map((loan) => LoanModel.fromJson(loan as Map<String, dynamic>))
          .toList(),
      upcoming: UpcomingModel.fromJson(
        json['upcoming'] as Map<String, dynamic>,
      ),
    );
  }

  @override
  String toString() =>
      'ObligationsGoldModel(customerName: $customerName, phone: $phone, totalPayment: $totalPayment, loans: $loans, upcoming: ${upcoming.toString()})';

  @override
  List<Object?> get props => [
    customerName,
    phone,
    totalPayment,
    loans,
    upcoming,
  ];
}
