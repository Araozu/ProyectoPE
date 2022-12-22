import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_pe/pages/articulo.dart';
import 'package:proyecto_pe/routes/routes.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

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

  File? imagen = null;
  final picker = ImagePicker();

  Future selImagen(op) async{
    var pickedFile;
    if(op == 1){
      pickedFile = await picker.getImage(source: ImageSource.camera);
    }else{
      pickedFile = await   picker.getImage(source: ImageSource.gallery);
    }

    setState(() {
      if(pickedFile != null){
        imagen = File(pickedFile.path);
      }else{
        print('Imagen no seleccionada');
      }
    });
    Navigator.of(context).pop();
  }

  opciones(context){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            contentPadding: EdgeInsets.all(0),
            content: SingleChildScrollView(
                child: Column(
                  children: [
                    InkWell(
                      onTap: (){
                        selImagen(1);
                      },
                      child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(width: 1, color: Colors.grey))
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text('Tomar una foto', style: TextStyle(
                                    fontSize: 16
                                ),),
                              ),
                              Icon(Icons.camera_alt, color: Colors.redAccent)
                            ],
                          )
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        selImagen(2);
                      },
                      child: Container(
                          padding: EdgeInsets.all(20),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text('Seleccionar una foto', style: TextStyle(
                                    fontSize: 16
                                ),),
                              ),
                              Icon(Icons.image, color: Colors.redAccent)
                            ],
                          )
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                      child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.red
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text('Cancelar', style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white
                                ), textAlign: TextAlign.center,),
                              )
                            ],
                          )
                      ),
                    )
                  ],
                )
            ),
          );
        }
    );
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
                alignment: Alignment.center,
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: (){
                        opciones(context);
                      },

                      child: Text('Selecciona una imagen'),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    imagen == null ? Center(): Image.file(imagen!)
                  ],
                )
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
