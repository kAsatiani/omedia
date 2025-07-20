import 'package:equatable/equatable.dart';
import 'package:omedia/src/data/models/upcoming_item_model.dart';

class UpcomingModel extends Equatable {
  final int remainingDays;
  final bool today;
  final bool expired;
  final double paymentAmount;
  final List<UpcomingItemModel> items;
  final String paymentDate;

  const UpcomingModel({
    required this.remainingDays,
    required this.today,
    required this.expired,
    required this.paymentAmount,
    required this.items,
    required this.paymentDate,
  });

  factory UpcomingModel.fromJson(Map<String, dynamic> json) {
    return UpcomingModel(
      remainingDays: json['remaining_days'] as int,
      today: json['today'] as bool,
      expired: json['expired'] as bool,
      paymentAmount: (json['payment_amount'] as num).toDouble(),
      items: (json['items'] as List<dynamic>)
          .map(
            (item) => UpcomingItemModel.fromJson(item as Map<String, dynamic>),
          )
          .toList(),
      paymentDate: json['payment_date'] as String,
    );
  }
  @override
  String toString() =>
      'UpcomingModel(remainingDays: $remainingDays, today: $today, expired: $expired, paymentAmount: $paymentAmount, items: $items, paymentDate: $paymentDate)';

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
