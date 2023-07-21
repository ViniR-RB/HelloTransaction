import 'package:flutter_test/flutter_test.dart';
import 'package:hellotransaction/app/core/models/tokens_auth.dart';
import 'package:hellotransaction/app/core/services/token_decoder.dart';
import 'package:hellotransaction/app/modules/auth/auth_adapters.dart';

import '../../../constants/constants.dart';

void main() {
  group('Test in TokenDecoder', () {
    late TokensAuth token;
    setUp(() {
      token = AuthAdapter.dynamicFromTokenAuth(acessToken);
    });
    test('should me decoded token', () {
      final map = TokenDecoder.decodedToken(token.acessToken);

      expect(map, {"sub": 1, "iat": 1689821176, "exp": 1689907576});
    });
    test('should check date expire token', () {
      final result = TokenDecoder.expirationDate(token.acessToken);
      final dateTheTokenMustExpire =
          DateTime.fromMillisecondsSinceEpoch(1689907576 * 1000);
      expect(result, dateTheTokenMustExpire);
    });
    test('should return check the validation of the token', () {
      final result = TokenDecoder.isValid(token.acessToken);
      expect(result, false);
    });
  });
}
