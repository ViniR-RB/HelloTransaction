import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hellotransaction/app/core/execption.dart';
import 'package:hellotransaction/app/core/models/transaction.dart';
import 'package:hellotransaction/app/modules/home/event.dart';
import 'package:hellotransaction/app/modules/home/home_controller.dart';
import 'package:hellotransaction/app/modules/home/home_repository.dart';
import 'package:hellotransaction/app/modules/home/states.dart';
import 'package:hellotransaction/app/modules/home/transaction_adapter.dart';
import 'package:mocktail/mocktail.dart';

import '../../../constants/constants.dart';

class HomeRepositoryMock extends Mock implements HomeRepository {}

void main() {
  group('testing the HomeController', () {
    late HomeController homeController;
    late HomeRepository mockRepository;

    setUp(() {
      mockRepository = HomeRepositoryMock();
      homeController = HomeController(mockRepository);
    });
    test(
        'should emit LoadingGetTransactions and LoadedGetTransactions states for HomeFetchTransactionsEvent',
        () async {
      // Arrange
      final mockResult = Future<Either<AppException, List<Transaction>>>.value(
          right(transactions)); // Convert to Right type

      // Mocking the call to repository.getAllTransactions()
      when(() => mockRepository.getAllTransactions())
          .thenAnswer((_) async => mockResult);

      // Trigger the event
      homeController.inputController.add(HomeFetchTransactionsEvent());

      // Act & Assert
      await expectLater(
          homeController.stream,
          emitsInOrder([
            isA<HomeStateLoadingGetTransactions>(),
            isA<HomeStateLoadedGetTransactions>(),
          ]));
    });
    test(
        'should emit HomeStateErrorGetTransactions state for HomeFetchTransactionsEvent',
        () async {
      // Arrange
      final mockResult = Future<Either<AppException, List<Transaction>>>.value(
          left(AppException(message: 'message'))); // Convert to Right type

      // Mocking the call to repository.getAllTransactions()
      when(() => mockRepository.getAllTransactions())
          .thenAnswer((_) async => mockResult);

      // Trigger the event
      homeController.inputController.add(HomeFetchTransactionsEvent());

      // Act & Assert
      await expectLater(
          homeController.stream,
          emitsInOrder([
            isA<HomeStateLoadingGetTransactions>(),
            isA<HomeStateErrorGetTransactions>(),
          ]));
      homeController.inputController.close();
    });
  });
}

final List<Transaction> transactions =
    transactiondata.map(TransactionAdapter.jsonFromTransactionModel).toList();
