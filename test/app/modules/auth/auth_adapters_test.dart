import 'package:flutter_test/flutter_test.dart';
import 'package:hellotransaction/app/core/models/tokens_auth.dart';
import 'package:hellotransaction/app/modules/auth/auth_adapters.dart';

import '../../../constants/constants.dart';

void main() {
  test('should return dynamic from token auth', () {
    final TokensAuth tokens = AuthAdapter.dynamicFromTokenAuth(acessToken);
    expect(
        tokens.acessToken,
        equals(
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImlhdCI6MTY4OTgyMTE3NiwiZXhwIjoxNjg5OTA3NTc2fQ.r4tUW0klhXF2sY3Sf22LVj3C4y5nziOuXnjaiPyWdTs'));
  });
}
