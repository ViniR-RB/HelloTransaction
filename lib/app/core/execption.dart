class AppException implements Exception {
  final String message;
  AppException({required this.message});
}

class HomeGetAllTransactionError extends AppException {
  HomeGetAllTransactionError({required super.message});
}

class AuthLoginException extends AppException {
  AuthLoginException({required super.message});
}
