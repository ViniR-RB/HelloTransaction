import 'package:flutter_modular/flutter_modular.dart';
import 'package:hellotransaction/app/modules/home/home_controller.dart';
import 'package:hellotransaction/app/modules/home/home_repository.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<HomeRepository>((i) => HomeRepositoryImpl(i.get())),
        Bind<HomeController>((i) => HomeController(i.get())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (context, args) => const HomePage()),
      ];
}
