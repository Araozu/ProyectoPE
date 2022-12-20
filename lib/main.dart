import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_pe/auth_service.dart';
import 'package:proyecto_pe/pages/crear_publicacion.dart';
import 'package:proyecto_pe/pages/dieta.dart';
import 'package:proyecto_pe/pages/homepage.dart';
import 'package:proyecto_pe/pages/mapa.dart';
import 'package:proyecto_pe/routes/pages.dart';

import 'package:proyecto_pe/pages/login.dart';
import 'package:proyecto_pe/pages/perfil.dart';
import 'package:proyecto_pe/pages/register.dart';

import "package:firebase_core/firebase_core.dart";

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      print("User signed out");
    } else {
      print("User signed in");
    }
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Proyecto PE",
      home: AuthService().handleAuthState(),
      routes: Pages.routes,
    );
  }
}
