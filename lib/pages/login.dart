import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proyecto_pe/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);


  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool esComerciante = false;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool('comerciante', false);
    });
  }

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

          /*
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
                  hintText: "Contrase??a",
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

            */

          const SizedBox(height: 25),

          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              minimumSize: const Size(300, 50),
            ),
            icon: const FaIcon(FontAwesomeIcons.google, color: Colors.blue),
            label: const Text("Iniciar sesi??n con Google"),
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
            label: const Text("Iniciar sesi??n con GitHub"),
            onPressed: () {
              // Iniciar sesion con Google
              AuthService().githubSignIn();
            },
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 10,
              ), //SizedBox
              Text(
                'Soy comerciante: ',
                style: TextStyle(fontSize: 17.0),
              ), //Text
              SizedBox(width: 10), //SizedBox
              /** Checkbox Widget **/
              Checkbox(
                value: esComerciante,
                onChanged: (value) {
                  setState(() {
                    esComerciante = value ?? false;

                    SharedPreferences.getInstance().then((prefs) {
                      prefs.setBool('comerciante', true);
                    });
                  });
                },
              ), //Checkbox

            ],
          )
      ]),
    ),
    );
  }
}
