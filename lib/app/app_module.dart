import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hellotransaction/app/core/configuration.dart';
import 'package:hellotransaction/app/core/http_client.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton(
            (i) => Dio(BaseOptions(baseUrl: ConfigurationEnv.apiUrl))),
        Bind.singleton<HttpClient>((i) => DioHttpClient(dio: i.get())),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          Modular.initialRoute,
          module: HomeModule(),
        ),
      ];
}
