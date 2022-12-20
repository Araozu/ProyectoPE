import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:flutter_map/flutter_map.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:proyecto_pe/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:latlong2/latlong.dart';

import '../auth_service.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => RegisterState();
}

Marker create(double lat, double long) {
  return Marker(
    width: 160,
    height: 160,
    point: LatLng(lat, long),
    builder: (ctx) => const Icon(Icons.pin_drop),
    anchorPos: AnchorPos.align(AnchorAlign.center),
  );
}

class RegisterState extends State<Register> {
  // 0 cargando, 1 tiene cuenta, -1 no tiene cuenta
  var status = 0;
  var esComerciante = false;

  var db = FirebaseFirestore.instance;

  init() async {
    print("INNIT");
    var user = AuthService().getUser();
    var correoUsuarioLogeado = user?.email;

    // Recuperar si es comerciante
    final prefs = await SharedPreferences.getInstance();
    final bool? comerciante = prefs.getBool('comerciante');

    esComerciante = comerciante ?? false;

    await db.collection("usuario").get().then((ev) {
      for (var doc in ev.docs) {
        var data = doc.data();
        String? correo = data["correo"];

        if (correo != null && correoUsuarioLogeado != null && correo == correoUsuarioLogeado) {
          status = 1;
          print("EXISTE CORREO");

          prefs.setBool("comerciante", data["comerciante"] ?? false);

          // Ir a inicio
          Navigator.of(context).pushNamed(Routes.home);
          return;
        }
      }

      status = -1;
      print("NO EXISTE CORREO");

      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    // init();
  }


  String nombres = "";
  String apellidos = "";
  String pais = "";
  String region = "";
  String provincia = "";
  String distrito = "";
  double lat = 0;
  double long = 0;


  void setNombres(String? s) {
    nombres = s ?? "";
  }

  void setApellidos(String? s) {
    apellidos = s ?? "";
  }

  void setPais(String? s) {
    pais = s ?? "";
  }

  void setRegion(String? s) {
    region = s ?? "";
  }

  void setProvincia(String? s) {
    provincia = s ?? "";
  }

  void setDistrito(String? s) {
    distrito = s ?? "";
  }

  void setLatLong(double lat, double long) {
    this.lat = lat;
    this.long = long;
  }

  void registrar() {
    if (
      nombres == "" || pais == ""
      || region == "" || provincia == "" || distrito == ""
    ) {
      Fluttertoast.showToast(msg: "Por favor llena todos los campos.");
      return;
    }

    var user = AuthService().getUser();
    var correoUsuarioLogeado = user?.email!;

    final usuario = <String, dynamic> {
      "apellidos": apellidos,
      "nombres": nombres,
      "correo": correoUsuarioLogeado,
      "distrito": distrito,
      "pais": pais,
      "provincia": provincia,
      "region": region,
      "comerciante": esComerciante,
      "lat": lat,
      "long": long,
    };

    db.collection("usuario").add(usuario).then((DocumentReference doc) {
      print("ALMACENADO");
      Navigator.of(context).pushNamed(Routes.home);
    });
  }

  var markers = <Marker>[
    /*
    Marker(
      width: 160,
      height: 160,
      point: LatLng(lat, long),
      builder: (ctx) => const Icon(Icons.pin_drop),
      anchorPos: anchorPos,
    ),
     */
  ];

  @override
  Widget build(BuildContext context) {
    if (status == 0) {
      init();

      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: Text("Cargando...")
              )
            ],
          )
        )
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
            children: [

              Container(
                margin: EdgeInsets.only(left: 33, right: 33, top: 50),
                alignment: Alignment.center,
                child: const Text(
                  "BIENVENIDO",
                  style: TextStyle(
                      fontSize: 24,
                      color: Color(0xfff91f1f)
                  ),
                ),
              ),

              const Text("Completa tus datos para continuar"),

              Container(
                margin: EdgeInsets.only(left: 33, right: 33, top: 40),
                padding: EdgeInsets.only(left: 20, right: 20),
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
                  decoration: InputDecoration(
                    hintText: esComerciante? "Nombre de empresa" : "Nombres",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  onChanged: (s) {
                    setNombres(s);
                  },
                ),
              ),

              esComerciante ? Container() :
              Container(
                margin: EdgeInsets.only(left: 33, right: 33, top: 30),
                padding: EdgeInsets.only(left: 20, right: 20),
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
                  decoration: InputDecoration(
                    hintText: "Apellidos",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  onChanged: (s) {
                    setApellidos(s);
                  },
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
                    hintText: "Pais",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  onChanged: (s) {
                    setPais(s);
                  },
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
                    hintText: "Region",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  onChanged: (s) {
                    setRegion(s);
                  },
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
                    hintText: "Provincia",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  onChanged: (s) {
                    setProvincia(s);
                  },
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
                    hintText: "Distrito",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  onChanged: (s) {
                    setDistrito(s);
                  },
                ),
              ),

              Container(height: 20),
              const Text("Ubicacion del negocio:"),

              esComerciante ? SizedBox(
                height: 400,
                child: FlutterMap(
                  options: MapOptions(
                    center: LatLng(-16.4099486, -71.5383974),
                    onLongPress: (pos, latlng) {
                      var lat = latlng.latitude;
                      var long = latlng.longitude;

                      print("LAT: ${lat}, LONG: ${long}");

                      markers = [create(lat, long)];
                      setLatLong(lat, long);
                      setState(() {});
                    },
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                      'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                    ),
                    MarkerLayer(markers: markers),
                  ],
                ),
              ) : Container(),

              GestureDetector(
                onTap: registrar,
                child: Container(
                  margin: EdgeInsets.only(left: 33, right: 33, top: 40),
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),
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
                    "Ingresar",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18
                    ),
                  ),
                ),
              ),

            ],
          )
      ),
    );
  }
}


