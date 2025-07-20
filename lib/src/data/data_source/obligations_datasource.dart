import 'package:dio/dio.dart';
import 'package:omedia/src/data/models/models.dart';

sealed class ObligationsDataSource {
  Future<ObligationsGoldModel> getObligationsGold();
  Future<ObligationsOtherModel> getObligationsOther();
}

class ObligationsDataSourceImplementation implements ObligationsDataSource {
  final Dio _dio;

  ObligationsDataSourceImplementation({Dio? dio}) : _dio = dio ?? Dio() {
    _initDio();
  }

  void _initDio() {
    _dio.options = BaseOptions(
      baseUrl: 'https://f1-mock.omedialab.com/api/',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      sendTimeout: const Duration(seconds: 20),
    );

    _dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        error: true,
        logPrint: (object) => print('OBJECT => $object'),
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          handler.next(options);
        },
        onError: (error, handler) {
          print(' ERROR => ${error.message}');
          handler.next(error);
        },
      ),
    );
  }

  @override
  Future<ObligationsGoldModel> getObligationsGold() async {
    try {
      final response = await _dio.get('obligations/gold');

      if (response.statusCode == 200 && response.data != null) {
        return ObligationsGoldModel.fromJson(response.data);
      } else {
        throw Exception(
          'Failed to load gold obligations: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  @override
  Future<ObligationsOtherModel> getObligationsOther() async {
    try {
      final response = await _dio.get('obligations/other');

      if (response.statusCode == 200 && response.data != null) {
        return ObligationsOtherModel.fromJson(response.data);
      } else {
        throw Exception(
          'Failed to load other obligations: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  Exception _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return Exception('Connection timeout');
      case DioExceptionType.sendTimeout:
        return Exception('Send timeout');
      case DioExceptionType.receiveTimeout:
        return Exception('Receive timeout');
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        switch (statusCode) {
          case 400:
            return Exception('Bad request');
          case 401:
            return Exception('Unauthorized');
          case 403:
            return Exception('Forbidden');
          case 404:
            return Exception('not found.');
          case 500:
            return Exception('Server error');
          default:
            return Exception('Error: $statusCode');
        }
      case DioExceptionType.connectionError:
        return Exception('No internet connection');
      default:
        return Exception('Unexpected error: ${e.message}');
    }
  }
}
