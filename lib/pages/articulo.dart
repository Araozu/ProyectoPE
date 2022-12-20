import "package:flutter/material.dart";
import 'package:proyecto_pe/pages/homepage.dart';

class Publicacion {
  final String nombre;
  final int cantidad;
  final String tipo;
  final String direccion;
  final String imagen;
  final double precioNormal;
  final double precio;
  final String correoComerciante;

  Publicacion(
      {required this.nombre,
      required this.cantidad,
      required this.tipo,
      required this.direccion,
      required this.imagen,
      required this.precioNormal,
      required this.precio,
      required this.correoComerciante});

  static Publicacion from(Map<String, dynamic> data) {
    return Publicacion(
        nombre: data['nombre'],
        cantidad: data['cantidad'],
        tipo: data['tipo'],
        direccion: data['direccion'],
        imagen: data['imagen'],
        precioNormal: (data['precioNormal'] as int).toDouble(),
        precio: (data['precio'] as int).toDouble(),
        correoComerciante: data['correoComerciante']);
  }
}

class Articulo extends StatefulWidget {
  const Articulo({Key? key, required this.publicacion}) : super(key: key);

  final Publicacion publicacion;

  @override
  State<Articulo> createState() => _ArticuloState(publicacion);
}

int percentage(double partial, double total) {
  return ((100 * (total - partial)) / total).round();
}

class _ArticuloState extends State<Articulo> {
  _ArticuloState(this.publicacion);

  final Publicacion publicacion;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
    ]);
  }
}
