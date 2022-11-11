import 'package:flutter/cupertino.dart';
import 'package:proyecto_pe/pages/homepage.dart';
import 'package:proyecto_pe/pages/login.dart';
import 'package:proyecto_pe/pages/perfil.dart';
import 'package:proyecto_pe/routes/routes.dart';

abstract class Pages {
  static Map<String, Widget Function(BuildContext)> routes = {
    Routes.home: (BuildContext context) => const HomePage(),
    Routes.login: (BuildContext context) => const Login(),
    Routes.perfil: (BuildContext context) => const Perfil(),
  };
}
