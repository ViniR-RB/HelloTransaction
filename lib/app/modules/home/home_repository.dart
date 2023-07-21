import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hellotransaction/app/modules/home/transaction_adapter.dart';

import '../../core/execption.dart';
import '../../core/http_client.dart';
import '../../core/models/transaction.dart';

abstract class HomeRepository {
  Future<Either<AppException, List<Transaction>>> getAllTransactions();

  getBalance();
}

class HomeRepositoryImpl implements HomeRepository {
  final HttpClient _httpClient;

  HomeRepositoryImpl(this._httpClient);

  @override
  Future<Either<AppException, List<Transaction>>> getAllTransactions() async {
    try {
      final response = await _httpClient.get('/api/transaction/investor');
      final data = response.data as List<dynamic>;
      final List<Transaction> transactions =
          data.map(TransactionAdapter.jsonFromTransactionModel).toList();
      return Right(transactions);
    } on DioException catch (e) {
      return Left(
        HomeGetAllTransactionError(
            message: e.message ?? 'Houve Algum Problema'),
      );
    } catch (e) {
      return Left(
        AppException(message: e.toString()),
      );
    }
  }

  @override
  getBalance() {
    // TODO: implement getBalance
    throw UnimplementedError();
  }
}
