import 'package:flutter_modular/flutter_modular.dart';
import 'package:hellotransaction/app/modules/auth/pages/login_page.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (context, args) => const LoginPage(),
    )
  ];
}
