import 'package:equatable/equatable.dart';
import 'package:omedia/src/data/models/models.dart';

class UpcomingOtherModel extends Equatable {
  final int remainingDays;
  final bool today;
  final bool expired;
  final double paymentAmount;
  final List<UpcomingOtherItemModel> items;
  final String paymentDate;

  const UpcomingOtherModel({
    required this.remainingDays,
    required this.today,
    required this.expired,
    required this.paymentAmount,
    required this.items,
    required this.paymentDate,
  });

  factory UpcomingOtherModel.fromJson(Map<String, dynamic> json) {
    return UpcomingOtherModel(
      remainingDays: json['remaining_days'] as int,
      today: json['today'] as bool,
      expired: json['expired'] as bool,
      paymentAmount: (json['payment_amount'] as num).toDouble(),
      items: (json['items'] as List<dynamic>)
          .map(
            (item) =>
                UpcomingOtherItemModel.fromJson(item as Map<String, dynamic>),
          )
          .toList(),
      paymentDate: json['payment_date'] as String,
    );
  }

  @override
  List<Object?> get props => [
    remainingDays,
    today,
    expired,
    paymentAmount,
    items,
    paymentDate,
  ];
}
