import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hellotransaction/app/core/execption.dart';
import 'package:hellotransaction/app/core/http_client.dart';
import 'package:hellotransaction/app/core/services/set_token_in_request.dart';

import '../../core/models/tokens_auth.dart';
import '../../core/services/secure_storage.dart';
import 'auth_adapters.dart';

abstract class AuthRepository {
  Future<Either<AppException, TokensAuth>> login(String email, String password);
}

class AuthRepositoryImpl implements AuthRepository {
  final HttpClient _httpClient;
  final SecureStorage _storage;
  AuthRepositoryImpl(this._httpClient, this._storage);
  @override
  Future<Either<AppException, TokensAuth>> login(
      String email, String password) async {
    try {
      final response = await _httpClient.post("/api/auth/login",
          data: {"email": email, "password": password});
      final tokensAuth = AuthAdapter.dynamicFromTokenAuth(response.data);
      await _storage.write('acess_token', tokensAuth.acessToken);
      SetTokenInRequest().setToken(tokensAuth.acessToken);
      return Right(tokensAuth);
    } on DioException catch (e) {
      return Left(
          AuthLoginException(message: e.message ?? 'Houve um Problema'));
    } catch (e) {
      return Left(AppException(message: e.toString()));
    }
  }
}
