part of 'obligations_bloc.dart';

abstract class ObligationsEvent extends Equatable {
  const ObligationsEvent();

  @override
  List<Object> get props => [];
}

class LoadObligationsGold extends ObligationsEvent {
  const LoadObligationsGold();
}

class LoadObligationsOther extends ObligationsEvent {
  const LoadObligationsOther();
}

class LoadBothObligations extends ObligationsEvent {
  const LoadBothObligations();
}
