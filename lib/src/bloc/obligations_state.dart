part of 'obligations_bloc.dart';

enum ObligationsStatus { initial, loading, success, error }

class ObligationsState extends Equatable {
  final ObligationsStatus status;
  final String? errorMessage;
  final ObligationsGoldModel? obligationsGold;
  final ObligationsOtherModel? obligationsOther;

  const ObligationsState({
    this.status = ObligationsStatus.initial,
    this.errorMessage,
    this.obligationsGold,
    this.obligationsOther,
  });

  ObligationsState copyWith({
    ObligationsStatus? status,
    String? errorMessage,
    ObligationsGoldModel? obligationsGold,
    ObligationsOtherModel? obligationsOther,
  }) {
    return ObligationsState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      obligationsGold: obligationsGold ?? this.obligationsGold,
      obligationsOther: obligationsOther ?? this.obligationsOther,
    );
  }

  double sumObligations() {
    final double sumGold =
        obligationsGold?.loans.fold(
          0.0,
          (sum, loan) => (sum ?? 0) + loan.issueAmount,
        ) ??
        0;
    final double sumOther =
        obligationsOther?.loans.fold(
          0.0,
          (sum, loan) => (sum ?? 0) + loan.issueAmount,
        ) ??
        0;

    return sumGold + sumOther;
  }

  double sumOtherObligations() {
    final double sumOther =
        obligationsOther?.loans.fold(
          0.0,
          (sum, loan) => (sum ?? 0) + loan.issueAmount,
        ) ??
        0;

    return sumOther;
  }

  @override
  List<Object?> get props => [
    status,
    obligationsGold,
    obligationsOther,
    errorMessage,
  ];
}
