import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:proyecto_pe/pages/articulo.dart';
import 'package:proyecto_pe/pages/tienda.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../routes/routes.dart';

class Comerciante {
  final String nombres;
  final String correo;
  final String distrito;
  final String pais;
  final String provincia;
  final String region;
  final double lat;
  final double long;

  Comerciante({
    required this.nombres,
    required this.correo,
    required this.distrito,
    required this.pais,
    required this.provincia,
    required this.region,
    required this.lat,
    required this.long,
  });

  static Comerciante from(Map<String, dynamic> data) {
    return Comerciante(
      nombres: data['nombres'],
      correo: data['correo'],
      distrito: data['distrito'],
      pais: data['pais'],
      provincia: data['provincia'],
      region: data['region'],
      lat: data['lat'],
      long: data['long'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (nombres != null) "nombres": nombres,
      if (correo != null) "correo": correo,
      if (distrito != null) "distrito": distrito,
      if (pais != null) "pais": pais,
      if (provincia != null) "provincia": provincia,
      if (region != null) "region": region,
      "comerciante": true,
      "apellidos": "",
    };
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool esComerciante = false;

  init() async {
    final prefs = await SharedPreferences.getInstance();
    final bool? comerciante = prefs.getBool('comerciante');

    esComerciante = comerciante ?? false;
    print("INIT: ${esComerciante}");

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.account_circle),
          onPressed: () {
            Navigator.of(context).pushNamed(Routes.perfil);
          },
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "¿Qué\ncomeré?",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),

              /*
              TextField(
                decoration: InputDecoration(
                    hintText: 'Comida o lugar',
                    contentPadding: const EdgeInsets.all(15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
                onChanged: (value) {
                  // do something
                },
              ),
              */

              SizedBox(
                  height: 40,
                  child: ListView(
                    padding: const EdgeInsets.all(8),
                    scrollDirection: Axis.horizontal,
                    children: [
                      Text("Comidas"),
                      Container(width: 10),
                      Text(
                        "Pan",
                        style: TextStyle(
                            // color: Colors.red,
                            // decoration: TextDecoration.underline),
                        )),
                      Container(width: 10),
                      Text("Bebidas"),
                      Container(width: 10),
                      Text("Provisiones"),
                      Container(width: 10),
                      Text("Pasteles"),
                      Container(width: 10),
                      Text("Verduras"),
                    ],
                  )),


              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("usuario")
                      .where("comerciante", isEqualTo: true)
                      .snapshots(),
                  builder: (ctx, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    var x = snapshot.data!.docs.map((e) => Comerciante.from(e.data()));
                    return ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: x.map((c) => Tienda(comerciante: c)).toList(),
                    );
                  })
            ]),
      )),
      floatingActionButton: esComerciante ? FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(Routes.crearPub);
        },
        backgroundColor: Colors.red,
        child: Icon(Icons.add),
      ) : null,
    );
  }
}
