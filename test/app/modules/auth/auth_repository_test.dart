import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hellotransaction/app/core/http_client.dart';
import 'package:hellotransaction/app/core/models/tokens_auth.dart';
import 'package:hellotransaction/app/core/services/secure_storage.dart';
import 'package:hellotransaction/app/modules/auth/auth_adapters.dart';
import 'package:hellotransaction/app/modules/auth/auth_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../../../constants/constants.dart';

class HttpClienteMock extends Mock implements HttpClient {}

class SecureStorageMock extends Mock implements SecureStorage {}

void main() {
  group('Test in Auth Repository', () {
    late final AuthRepository repository;
    late final HttpClient httpClient;
    late final SecureStorage storage;
    setUp(() {
      httpClient = HttpClienteMock();
      storage = SecureStorageMock();
      repository = AuthRepositoryImpl(httpClient, storage);
    });
    test('should return TokensAuth in Login', () async {
      final response = Response<dynamic>(
          data: acessToken,
          statusCode: 200,
          requestOptions: RequestOptions(
            path: '',
          ));
      when(() => httpClient.post(
            any(),
            data: {"email": emailConstant, "password": passwordConstant},
          )).thenAnswer((_) async => response);
      final TokensAuth tokensAuth =
          AuthAdapter.dynamicFromTokenAuth(response.data);
      when(() => storage.write('acess_token', tokensAuth.acessToken))
          .thenAnswer((_) async => tokensAuth.acessToken);
      final result = await repository.login(emailConstant, passwordConstant);
      expect(result.fold(id, id), isA<TokensAuth>());
    });
  });
}
