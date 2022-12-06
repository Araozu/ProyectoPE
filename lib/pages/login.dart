import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proyecto_pe/auth_service.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 45),
                      padding: EdgeInsets.only(top: 40, left: 20),
                      alignment: Alignment.center,
                      width: 165,
                      height: 165,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                          color: Color(0xfff91f1f)
                      ),
                      child: Column(
                        children: [
                          Row(
                          children: [
                            Text(
                              "REST ",
                              style: TextStyle(
                                fontFamily: 'AbrilFatface',
                                color: Colors.white,
                                fontSize: 32,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                            Icon(
                                Icons.breakfast_dining,
                                color: Colors.white,
                                size: 40,
                            )
                          ],
                          ),
                          Text(
                            "FOOD",
                            style: TextStyle(
                              fontFamily: 'AbrilFatface',
                              color: Colors.white,
                              fontSize: 32,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ],
                      )
                    ),

                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 33, right: 33, top: 30),
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),

                color: Colors.grey[300],
                boxShadow: [BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 50,
                  color: Color(0xffEEEEEE)
                )],
              ),
              alignment: Alignment.center,
              child: TextField(
                style: TextStyle(fontSize: 15),
                cursorColor: Color(0xfff91f1f),
                decoration: InputDecoration(
                  hintText: "Usuario",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 33, right: 33, top: 20),
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[300],
                boxShadow: [BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Color(0xffEEEEEE)
                )],
              ),
              alignment: Alignment.center,
              child: TextField(
                style: TextStyle(fontSize: 15),
                obscureText: true,
                cursorColor: Color(0xfff91f1f),
                decoration: InputDecoration(
                  hintText: "Contraseña",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),

            GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.only(left: 33, right: 33, top: 60),
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                alignment: Alignment.center,
                height: 54,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [BoxShadow(
                      offset: Offset(0, 10),
                      color: Color(0xfff91f1f)
                  )],
                ),
                child: Text(
                  "Ingresar",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                minimumSize: const Size(300, 50),
              ),
              icon: const FaIcon(FontAwesomeIcons.google, color: Colors.blue),
              label: const Text("Iniciar sesión con Google"),
              onPressed: () {
                // Iniciar sesion con Google
                AuthService().googleSignIn();
              },
            ),

            const SizedBox(height: 10),

            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                minimumSize: const Size(300, 50),
              ),
              icon: const FaIcon(FontAwesomeIcons.github, color: Colors.black),
              label: const Text("Iniciar sesión con GitHub"),
              onPressed: () {
                // Iniciar sesion con Google
                AuthService().githubSignIn();
              },
            ),

            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 120, right: 91, top: 30),
              height: 54,
              child: GestureDetector(
                onTap: ()=>{

                },
                child: Row(
                  children: [
                    Text(
                      "¿No tienes cuenta? ",
                      style: TextStyle(
                          fontSize: 12
                      ),
                    ),
                    Text(
                      "Registrarte",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                        fontSize: 12

                      ),
                    ),
                  ],
                )
              ),
            ),

          ],
        )
      ),
    );
  }
}
