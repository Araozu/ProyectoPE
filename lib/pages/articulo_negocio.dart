import "package:flutter/material.dart";
import 'package:proyecto_pe/pages/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../routes/routes.dart';
import 'articulo.dart';


class ArticuloNegocio extends StatefulWidget {
  const ArticuloNegocio({Key? key, required this.publicacion, required this.lat, required this.long}) : super(key: key);

  final Publicacion publicacion;
  final double lat;
  final double long;

  @override
  State<ArticuloNegocio> createState() => _ArticuloNegocioState(publicacion, lat, long);
}

int percentage(double partial, double total) {
  return ((100 * (total - partial)) / total).round();
}

class _ArticuloNegocioState extends State<ArticuloNegocio> {
  _ArticuloNegocioState(this.publicacion, this.lat, this.long);

  final Publicacion publicacion;
  final double lat;
  final double long;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      child: Column(children: [
        Container(
          height:20,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          width: 350,
          child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.topLeft,
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: 10,
                      ),
                      Positioned(
                          top:1,
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(publicacion.imagen),
                          )),
                    ],
                  ),

                  Text(
                    "Nombre:  ${publicacion.nombre}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Cantidad: ${publicacion.cantidad}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Descuento: -${percentage(publicacion.precio, publicacion.precioNormal)}%",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),

                    ],
                  ),
                  Text(
                    "Precio Original: S/. ${publicacion.precioNormal}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Precio Venta: S/. ${publicacion.precio} U",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                      children: [ElevatedButton(
                          onPressed: (){ },
                          child: const Text('Publicar')),
                      ]
                  ),
                ],

              )),
        )
      ]),
    );
  }
}
