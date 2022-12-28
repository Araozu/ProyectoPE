import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:geolocator/geolocator.dart';
import 'package:proyecto_pe/pages/articulo.dart';
import 'package:proyecto_pe/pages/publicaciones_tienda.dart';
import 'package:proyecto_pe/pages/tienda.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../auth_service.dart';
import '../routes/routes.dart';
import 'homepage.dart';


class PublicacionNegocio extends StatefulWidget {
  const PublicacionNegocio({Key? key}) : super(key: key);

  @override
  State<PublicacionNegocio> createState() => _PublicacionNegocio();
}

class _PublicacionNegocio extends State<PublicacionNegocio> {
  bool esComerciante = true;
  var correo = AuthService().getUser()?.email;
  var nombres="";

  init() async {
    final prefs = await SharedPreferences.getInstance();
    final bool? comerciante = prefs.getBool('comerciante');
    nombres = prefs.getString("nombres")!;

    esComerciante = comerciante ?? false;
    print("INIT: ${esComerciante}");

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  String locationMessage = 'Current location of the user';
  late String lat;
  late String long;

  //Getting current Location
  Future<Position> _getCurrentLocation() async{
    bool serviceEnabled =  await Geolocator.isLocationServiceEnabled();
    if(!serviceEnabled){
      return Future.error('Location services are disabled');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if(permission == LocationPermission.deniedForever){
      return Future.error('Location permissions are permanently denied');
    }
    return await Geolocator.getCurrentPosition();
  }

  //Listen to location updates
  void _liveLocation() {
    LocationSettings locationSettings = const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100
    );

    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position position) {
      lat = position.latitude.toString();
      long = position.longitude.toString();

      setState(() {
        locationMessage = 'Latitude: $lat, Longitude: $long';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: const Text("Publicaciones"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
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
                  StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("usuario")
                          .where("nombres", isEqualTo: nombres)
                          .snapshots(),
                      builder: (ctx, snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        var x = snapshot.data!.docs.map((e) => Comerciante.from(e.data()));
                        return Column(
                          children: x.map((c) => TiendaPublicaciones(comerciante: c)).toList(),
                        );
                      })
                ]),
          )),

    );
  }
}