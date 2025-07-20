import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omedia/src/data/models/obligations_gold_model.dart';
import 'package:omedia/src/data/models/obligations_other_model.dart';
import 'package:omedia/src/data/repositories/obligtations_repository.dart';

part 'obligations_state.dart';
part 'obligations_event.dart';

class ObligationsBloc extends Bloc<ObligationsEvent, ObligationsState> {
  final ObligationsRepository _repository;

  ObligationsBloc({required ObligationsRepository repository})
    : _repository = repository,
      super(const ObligationsState()) {
    on<LoadObligationsGold>(_onLoadObligationsGold);
    on<LoadObligationsOther>(_onLoadObligationsOther);
    on<LoadBothObligations>(_onLoadBothObligations);
  }

  Future<void> _onLoadObligationsGold(
    LoadObligationsGold event,
    Emitter<ObligationsState> emit,
  ) async {
    emit(state.copyWith(status: ObligationsStatus.loading, errorMessage: null));
    try {
      final obligations = await _repository.getObligationsGold();
      emit(
        state.copyWith(
          status: ObligationsStatus.success,
          obligationsGold: obligations,
          errorMessage: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: ObligationsStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _onLoadObligationsOther(
    LoadObligationsOther event,
    Emitter<ObligationsState> emit,
  ) async {
    emit(state.copyWith(status: ObligationsStatus.loading, errorMessage: null));
    try {
      final obligations = await _repository.getObligationsOther();
      emit(
        state.copyWith(
          status: ObligationsStatus.success,
          obligationsOther: obligations,
          errorMessage: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: ObligationsStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _onLoadBothObligations(
    LoadBothObligations event,
    Emitter<ObligationsState> emit,
  ) async {
    emit(state.copyWith(status: ObligationsStatus.loading, errorMessage: null));
    try {
      final goldFuture = _repository.getObligationsGold();
      final otherFuture = _repository.getObligationsOther();
      final results = await Future.wait([goldFuture, otherFuture]);
      emit(
        state.copyWith(
          status: ObligationsStatus.success,
          obligationsGold: results[0] as ObligationsGoldModel,
          obligationsOther: results[1] as ObligationsOtherModel,
          errorMessage: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: ObligationsStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
