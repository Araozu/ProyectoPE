import "package:flutter/material.dart";
import 'package:proyecto_pe/routes/routes.dart';

class Perfil extends StatelessWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 340,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(150), bottomRight:Radius.circular(150)),
                    color: Color(0xfff91f1f)
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
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
                margin: EdgeInsets.only(left: 59, right: 59, top: 70),
                padding: EdgeInsets.only(left: 24, right: 24, top: 38, bottom: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.grey[300],
                  boxShadow: [BoxShadow(
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
                            "Estephany Mayra",
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
                          "Surco Alvarez",
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
                          "esurcoa@unsa.edu.pe",
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
                          "Pais: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                          ),
                        ),
                        Text(
                          "Peru",
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
                          "Region: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                          ),
                        ),
                        Text(
                          "Arequipa",
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
                          "Provincia: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                          ),
                        ),
                        Text(
                          "Caylloma",
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
                          "Distrito: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                          ),
                        ),
                        Text(
                          "Majes",
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
