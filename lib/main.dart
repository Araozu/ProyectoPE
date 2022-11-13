import 'package:flutter/material.dart';
import 'package:proyecto_pe/pages/dieta.dart';
import 'package:proyecto_pe/pages/homepage.dart';
import 'package:proyecto_pe/routes/pages.dart';

import 'package:proyecto_pe/pages/login.dart';
import 'package:proyecto_pe/pages/perfil.dart';
import 'package:proyecto_pe/pages/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Proyecto PE",
      home: const Login(),
      routes: Pages.routes,
    );
  }
}
