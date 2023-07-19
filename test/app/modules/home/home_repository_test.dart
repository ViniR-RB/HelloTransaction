import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hellotransaction/app/core/execption.dart';
import 'package:hellotransaction/app/core/http_client.dart';
import 'package:hellotransaction/app/core/models/transaction.dart';
import 'package:hellotransaction/app/modules/home/home_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../../../constants/constants.dart';

class HttpClientMock extends Mock implements HttpClient {}

void main() {
  group('testing the HomeRepository', () {
    late final HttpClient httpClient;
    late final HomeRepository repository;
    setUpAll(() => {
          httpClient = HttpClientMock(),
          repository = HomeRepositoryImpl(httpClient)
        });
    test('should me return list of Transaction ', () async {
      // assert
      final response = Response<dynamic>(
          data: transactiondata,
          statusCode: 200,
          requestOptions: RequestOptions(path: ''));

      when(() => httpClient.get(any())).thenAnswer((_) async => response);
      final result = await repository.getAllTransactions();
      expect(result.fold(id, id), isA<List<Transaction>>());
    });
    test('should return me an AppException for generic errors', () async {
      // assert

      when(() => httpClient.get(any())).thenThrow((_) async => Exception(''));
      final result = await repository.getAllTransactions();
      expect(result.fold(id, id), isA<AppException>());
    });
    test('should return me an HomeGetAllTransactionError for DioError',
        () async {
      // assert
      final DioException dioError =
          DioException(requestOptions: RequestOptions(path: ''));
      when(() => httpClient.get(any())).thenThrow(dioError);
      final result = await repository.getAllTransactions();
      expect(result, isA<Left<AppException, List<Transaction>>>());
      final error = result.fold((l) => l, (r) => null);
      expect(error, isA<HomeGetAllTransactionError>());
    });
  });
}
