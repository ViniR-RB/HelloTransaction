import 'package:hellotransaction/app/core/models/tokens_auth.dart';

abstract class AuthAdapter {
  static TokensAuth dynamicFromTokenAuth(dynamic a) {
    return TokensAuth(acessToken: a['acess_token']);
  }
}
