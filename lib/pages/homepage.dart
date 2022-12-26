import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:geolocator/geolocator.dart';
import 'package:proyecto_pe/pages/tienda.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:haversine_distance/haversine_distance.dart';

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
  Position? position;

  init() async {
    final prefs = await SharedPreferences.getInstance();
    final bool? comerciante = prefs.getBool('comerciante');

    try {
      position = await _getCurrentLocation();
      print("Ubicacion obtenida");
    } catch (e) {}

    esComerciante = comerciante ?? false;
    print("INIT: ${esComerciante}");

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  //Getting current Location
  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }
    return await Geolocator.getCurrentPosition();
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
              SizedBox(
                  height: 40,
                  child: ListView(
                    padding: const EdgeInsets.all(8),
                    scrollDirection: Axis.horizontal,
                    children: [
                      const Text("Comidas"),
                      Container(width: 10),
                      const Text("Pan",
                          style: TextStyle(
                              // color: Colors.red,
                              // decoration: TextDecoration.underline),
                              )),
                      Container(width: 10),
                      const Text("Bebidas"),
                      Container(width: 10),
                      const Text("Provisiones"),
                      Container(width: 10),
                      const Text("Pasteles"),
                      Container(width: 10),
                      const Text("Verduras"),
                    ],
                  )
              ),
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

                    List<Comerciante> comerciantes;
                    if (position != null) {
                      var posicionUsuario = Location(position!.latitude, position!.longitude);
                      var haversine = HaversineDistance();

                      comerciantes = snapshot
                          .data!
                          .docs
                          .map((e) => Comerciante.from(e.data()))
                          .toList();

                      comerciantes.sort((c1, c2) {
                        var pos1 = Location(c1.long, c1.lat);
                        var pos2 = Location(c2.long, c2.lat);

                        var distance1 = haversine.haversine(
                            pos1,
                            posicionUsuario,
                            Unit.METER
                        ).floor();
                        var distance2 = haversine.haversine(
                            pos2,
                            posicionUsuario,
                            Unit.METER
                        ).floor();

                        return distance1 < distance2 ? 1 : -1;
                      });
                    }
                    else {
                      comerciantes = snapshot
                          .data!
                          .docs
                          .map((e) => Comerciante.from(e.data()))
                          .toList();
                    }

                    return ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: comerciantes.map((c) => Tienda(comerciante: c)).toList(),
                    );
                  })
            ]),
      )),
      floatingActionButton: esComerciante
          ? FloatingActionButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.crearPub);
              },
              backgroundColor: Colors.red,
              child: Icon(Icons.add),
            )
          : null,
    );
  }
}
