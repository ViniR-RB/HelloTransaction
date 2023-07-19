import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class ConfigurationEnv {
  ConfigurationEnv._();
  static String _get(String name) => dotenv.env[name] ?? 'Not Found';
  static String get apiUrl => _get('api_url');
}
