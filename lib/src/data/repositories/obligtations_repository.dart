import 'package:omedia/src/data/data_source/obligations_datasource.dart';
import 'package:omedia/src/data/models/models.dart';

abstract class ObligationsRepository {
  Future<ObligationsGoldModel> getObligationsGold();
  Future<ObligationsOtherModel> getObligationsOther();
}

class ObligationsRepositoryImplementation implements ObligationsRepository {
  final ObligationsDataSource _dataSource;

  ObligationsRepositoryImplementation({
    required ObligationsDataSource dataSource,
  }) : _dataSource = dataSource;

  @override
  Future<ObligationsGoldModel> getObligationsGold() async {
    try {
      return await _dataSource.getObligationsGold();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ObligationsOtherModel> getObligationsOther() async {
    try {
      return await _dataSource.getObligationsOther();
    } catch (e) {
      rethrow;
    }
  }
}
