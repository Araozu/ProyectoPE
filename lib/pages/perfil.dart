import "package:flutter/material.dart";
import 'package:proyecto_pe/auth_service.dart';
import 'package:proyecto_pe/routes/routes.dart';

class Perfil extends StatelessWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = AuthService().getUser()!;

    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 340,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(150), bottomRight:Radius.circular(150)),
                    color: Color(0xfff91f1f)
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Perfil",
                        style: TextStyle(
                            fontSize: 24,
                            color: Color(0xffffffff)
                        ),
                      ),
                      Container(
                          child: Image.asset("images/wing.png"),
                          width: 165,
                          height: 165,
                      ),

                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 59, right: 59, top: 70),
                padding: const EdgeInsets.only(left: 24, right: 24, top: 38, bottom: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.grey[300],
                  boxShadow: const [BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 25,
                      color: Color(0xffEEEEEE)
                  )],
                ),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          Text(
                          "Nombres: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                          ),
                        ),
                          Text(
                            (user.displayName ?? "-").substring(0, 17),
                            // "Estephany Mayra",
                            style: TextStyle(
                                fontSize: 15
                            ),
                          ),
                        ]
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                        Text(
                          "Apellidos: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                          ),
                        ),
                        Text(
                          "-",
                          style: TextStyle(
                              fontSize: 15
                          ),
                        ),
                      ],
                    ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Row(
                      children: [
                        Text(
                          "correo: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                          ),
                        ),
                        Text(
                          user.email ?? "-",
                          // "esurcoa@unsa.edu.pe",
                          style: TextStyle(
                              fontSize: 15
                          ),
                        ),
                      ],
                    ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Row(
                      children: const [
                        Text(
                          "Pais: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                          ),
                        ),
                        Text(
                          "-",
                          style: TextStyle(
                              fontSize: 15
                          ),
                        ),
                      ],
                    ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Row(
                      children: const [
                        Text(
                          "Region: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                          ),
                        ),
                        Text(
                          "-",
                          style: TextStyle(
                              fontSize: 15
                          ),
                        ),
                      ],
                    ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Row(
                      children: const [
                        Text(
                          "Provincia: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                          ),
                        ),
                        Text(
                          "-",
                          style: TextStyle(
                              fontSize: 15
                          ),
                        ),
                      ],
                    ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Row(
                      children: const [
                        Text(
                          "Distrito: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                          ),
                        ),
                        Text(
                          "-",
                          style: TextStyle(
                              fontSize: 15
                          ),
                        ),
                      ],
                    ),
                    )
                  ],
                ),
              ),
            ],
          )
      ),
    );
  }
}
