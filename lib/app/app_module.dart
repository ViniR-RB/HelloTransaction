import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hellotransaction/app/core/configuration.dart';
import 'package:hellotransaction/app/core/http_client.dart';
import 'package:hellotransaction/app/core/services/secure_storage.dart';
import 'package:hellotransaction/app/modules/auth/auth_module.dart';
import 'package:hellotransaction/app/modules/home/home_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton(
            (i) => Dio(BaseOptions(baseUrl: ConfigurationEnv.apiUrl))),
        Bind.singleton<HttpClient>((i) => DioHttpClient(dio: i.get())),
        Bind.singleton((i) => const FlutterSecureStorage(
            aOptions: AndroidOptions(encryptedSharedPreferences: true))),
        Bind<SecureStorage>((i) => SecureStorageImpl(i.get()))
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          Modular.initialRoute,
          module: AuthModule(),
        ),
        ModuleRoute(
        '/home',
          module: HomeModule(),
        ),
      ];
}
