import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_pe/pages/articulo.dart';
import 'package:proyecto_pe/routes/routes.dart';

import '../auth_service.dart';

class CrearPublicacion extends StatefulWidget {

  @override
  State<CrearPublicacion> createState() => _CrearPublicacionState();
}

class _CrearPublicacionState extends State<CrearPublicacion> {

  String dropdownValue = 'Comida';
  String nombre = "";
  int cantidad = 0;
  double precioNormal = 0.0;
  double precioDescuento = 0.0;
  String img = "";

  var items = [
    "Comida",
    "Pan",
    "Bebidas",
    "Provisiones",
    "Pasteles",
    "Verduras",
    "Frutas",
  ];

  void crear() {
    var user = AuthService().getUser();
    var correoUsuarioLogeado = user!.email!;

    final pub = <String, dynamic> {
      "nombre": nombre,
      "cantidad": cantidad,
      "tipo": dropdownValue,
      "imagen": img,
      "precioNormal": precioNormal,
      "precio": precioDescuento,
      "correoComerciante": correoUsuarioLogeado,
    };
    
    FirebaseFirestore.instance
        .collection("publicacion")
        .add(pub)
        .then((_) {
          Navigator.of(context).pushNamed(Routes.home);
        });
  }

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text("Crear publicación"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Container(
              margin: const EdgeInsets.only(left: 33, right: 33, top: 40),
              padding: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),

                color: Colors.grey[300],
                boxShadow: const [BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Color(0xffEEEEEE)
                )],
              ),
              alignment: Alignment.center,
              child: TextField(
                style: TextStyle(fontSize: 15),
                cursorColor: Color(0xfff91f1f),
                decoration: const InputDecoration(
                  hintText: "Nombre del producto",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                onChanged: (s) {
                  nombre = s ?? "";
                },
              ),
            ),


            Container(
              margin: const EdgeInsets.only(left: 33, right: 33, top: 40),
              padding: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),

                color: Colors.grey[300],
                boxShadow: const [BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Color(0xffEEEEEE)
                )],
              ),
              alignment: Alignment.center,
              child: TextField(
                style: TextStyle(fontSize: 15),
                cursorColor: Color(0xfff91f1f),
                decoration: const InputDecoration(
                  hintText: "Cantidad",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                onChanged: (s) {
                  cantidad = int.parse(s);
                },
              ),
            ),


            Container(
              margin: const EdgeInsets.only(left: 33, right: 33, top: 40),
              padding: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),

                color: Colors.grey[300],
                boxShadow: const [BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Color(0xffEEEEEE)
                )],
              ),
              alignment: Alignment.center,
              child: TextField(
                style: TextStyle(fontSize: 15),
                cursorColor: Color(0xfff91f1f),
                decoration: const InputDecoration(
                  hintText: "Precio normal",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                onChanged: (s) {
                  precioNormal = double.parse(s);
                },
              ),
            ),


            Container(
              margin: const EdgeInsets.only(left: 33, right: 33, top: 40),
              padding: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),

                color: Colors.grey[300],
                boxShadow: const [BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Color(0xffEEEEEE)
                )],
              ),
              alignment: Alignment.center,
              child: TextField(
                style: TextStyle(fontSize: 15),
                cursorColor: Color(0xfff91f1f),
                decoration: const InputDecoration(
                  hintText: "Precio con descuento",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                onChanged: (s) {
                  precioDescuento = double.parse(s);
                },
              ),
            ),

            Container(
              margin: const EdgeInsets.only(left: 33, right: 33, top: 40),
              padding: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),

                color: Colors.grey[300],
                boxShadow: const [BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Color(0xffEEEEEE)
                )],
              ),
              alignment: Alignment.center,
              child: TextField(
                style: TextStyle(fontSize: 15),
                cursorColor: Color(0xfff91f1f),
                decoration: const InputDecoration(
                  hintText: "Imagen",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                onChanged: (s) {
                  img = s;
                },
              ),
            ),


            Container(
              margin: const EdgeInsets.only(left: 33, right: 33, top: 40),
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  const Text("Tipo: "),
                  DropdownButton(
                    items: items.map((item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    icon: const Icon(Icons.keyboard_arrow_down),
                    value: dropdownValue,
                    onChanged: (v) {
                      setState(() {
                        dropdownValue = v ?? "Comida";
                      });
                    },
                  )
                ],
              ),
            ),


            GestureDetector(
              onTap: crear,
              child: Container(
                margin: const EdgeInsets.only(left: 33, right: 33, top: 40),
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                alignment: Alignment.center,
                height: 54,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: const [BoxShadow(
                      offset: Offset(0, 10),
                      color: Color(0xfff91f1f)
                  )],
                ),
                child: const Text(
                  "Crear publicación",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
