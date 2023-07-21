import 'package:jwt_decoder/jwt_decoder.dart';

class TokenDecoder {
  TokenDecoder._();
  static bool isValid(String token) {
    return JwtDecoder.isExpired(token);
  }

  static Map<String, dynamic> decodedToken(String token) {
    return JwtDecoder.decode(token);
  }

  static DateTime expirationDate(String token) {
    return JwtDecoder.getExpirationDate(token);
  }
}
