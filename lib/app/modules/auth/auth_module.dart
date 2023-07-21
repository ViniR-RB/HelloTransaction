import 'package:flutter_modular/flutter_modular.dart';
import 'package:hellotransaction/app/modules/auth/auth_controller.dart';
import 'package:hellotransaction/app/modules/auth/auth_repository.dart';
import 'package:hellotransaction/app/modules/auth/pages/login_page.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    Bind<AuthRepository>((i) => AuthRepositoryImpl(i.get(), i.get())),
    Bind<AuthController>((i) => AuthController(i.get()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (context, args) => const LoginPage(),
    )
  ];
}
