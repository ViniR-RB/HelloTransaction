import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Application Name',
      theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFF2A61EE),
          inputDecorationTheme: InputDecorationTheme(
            border: const OutlineInputBorder(),
            fillColor: Colors.grey[200],
          )),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
