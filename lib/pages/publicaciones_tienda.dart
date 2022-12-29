import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:proyecto_pe/pages/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../routes/routes.dart';
import 'articulo.dart';
import 'articulo_negocio.dart';

class TiendaPublicaciones extends StatefulWidget {
  const TiendaPublicaciones({Key? key, required this.comerciante}) : super(key: key);

  final Comerciante comerciante;

  @override
  State<TiendaPublicaciones> createState() => _TiendaPublicacionesState(comerciante);
}

class _TiendaPublicacionesState extends State<TiendaPublicaciones> {
  _TiendaPublicacionesState(this.comerciante);

  final Comerciante comerciante;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 20, // Image radius
              backgroundImage: NetworkImage(
                  'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/restaurant-logo-design-template-b281aeadaa832c28badd72c1f6c5caad_screen.jpg'),
            ),
            GestureDetector(

              child: Text(
                comerciante.nombres,
                style: TextStyle(fontWeight: FontWeight.bold),

              ),
            ),
          ],

        ),
        Container(
          height: 640,
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
            .collection("publicacion")
            .where("correoComerciante", isEqualTo: this.comerciante.correo)
            .snapshots(),
            builder: (ctx, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              var x = snapshot.data!.docs.map((d) => Publicacion.from(d.data()));

              return ListView(
                scrollDirection: Axis.vertical,
                children: x.map((p) => ArticuloNegocio(publicacion: p, lat: comerciante.lat, long: comerciante.long,)).toList(),
              );
            },
          ),

          /*
          ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Articulo(),
              SizedBox(
                width: 10,
              ),
              Articulo()
            ],
          ),
           */
        ),
      ],
    );
  }
}
