import "package:flutter/material.dart";
import 'package:proyecto_pe/pages/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../routes/routes.dart';

class Publicacion {
  final String nombre;
  final int cantidad;
  final String tipo;
  final String imagen;
  final double precioNormal;
  final double precio;
  final String correoComerciante;

  Publicacion(
      {required this.nombre,
      required this.cantidad,
      required this.tipo,
      required this.imagen,
      required this.precioNormal,
      required this.precio,
      required this.correoComerciante});

  static Publicacion from(Map<String, dynamic> data) {
    var precioNormal = data['precioNormal'];
    var precio = data['precio'];

    return Publicacion(
        nombre: data['nombre'],
        cantidad: data['cantidad'],
        tipo: data['tipo'],
        imagen: data['imagen'],
        precioNormal: precioNormal.runtimeType == int ? (precioNormal as int).toDouble() : precioNormal,
        precio: precio.runtimeType == int ? (precio as int).toDouble() : precio,
        correoComerciante: data['correoComerciante']);
  }
}

class Articulo extends StatefulWidget {
  const Articulo({Key? key, required this.publicacion, required this.lat, required this.long}) : super(key: key);

  final Publicacion publicacion;
  final double lat;
  final double long;

  @override
  State<Articulo> createState() => _ArticuloState(publicacion, lat, long);
}

int percentage(double partial, double total) {
  return ((100 * (total - partial)) / total).round();
}

class _ArticuloState extends State<Articulo> {
  _ArticuloState(this.publicacion, this.lat, this.long);

  final Publicacion publicacion;
  final double lat;
  final double long;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        var nav = Navigator.of(context);
        SharedPreferences.getInstance().then((prefs) async {
          await prefs.setDouble("lat", lat);
          await prefs.setDouble("long", long);
          nav.pushNamed(Routes.mapa);
        });
      },
      child: Column(children: [
      Container(
        height: 40,
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.red.shade100,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        width: 250,
        child: Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 80,
                    ),
                    Positioned(
                        top: -40,
                        child: CircleAvatar(
                          radius: 60,
                          backgroundImage: NetworkImage(publicacion.imagen),
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Quedan ${publicacion.cantidad}",
                      style: const TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text(
                  publicacion.nombre,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "-${percentage(publicacion.precio, publicacion.precioNormal)}%",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Text(
                      "S/. ${publicacion.precioNormal}",
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                    const Spacer(
                      flex: 5,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "S/. ${publicacion.precio} U",
                      style: const TextStyle(fontSize: 20),
                    )
                  ],
                )
              ],
            )),
      )
    ])
    );
  }
}
