import 'package:equatable/equatable.dart';

class UpcomingOtherItemModel extends Equatable {
  final String accountNumber;
  final int remainingDays;
  final bool expired;
  final bool today;
  final String paymentDate;
  final double paymentAmount;
  final double principalAmount;
  final double percentageAmount;
  final double fineAmount;

  const UpcomingOtherItemModel({
    required this.accountNumber,
    required this.remainingDays,
    required this.expired,
    required this.today,
    required this.paymentDate,
    required this.paymentAmount,
    required this.principalAmount,
    required this.percentageAmount,
    required this.fineAmount,
  });

  factory UpcomingOtherItemModel.fromJson(Map<String, dynamic> json) {
    return UpcomingOtherItemModel(
      accountNumber: json['account_number'] as String,
      remainingDays: json['remaining_days'] as int,
      expired: json['expired'] as bool,
      today: json['today'] as bool,
      paymentDate: json['payment_date'] as String,
      paymentAmount: (json['payment_amount'] as num).toDouble(),
      principalAmount: (json['principal_amount'] as num).toDouble(),
      percentageAmount: (json['percentage_amount'] as num).toDouble(),
      fineAmount: (json['fine_amount'] as num).toDouble(),
    );
  }

  @override
  List<Object?> get props => [
    accountNumber,
    remainingDays,
    expired,
    today,
    paymentDate,
    paymentAmount,
    principalAmount,
    percentageAmount,
    fineAmount,
  ];
}
