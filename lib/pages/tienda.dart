import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:proyecto_pe/pages/homepage.dart';

import 'articulo.dart';

class Tienda extends StatefulWidget {
  const Tienda({Key? key, required this.comerciante}) : super(key: key);

  final Comerciante comerciante;

  @override
  State<Tienda> createState() => _TiendaState(comerciante);
}

class _TiendaState extends State<Tienda> {
  _TiendaState(this.comerciante);

  final Comerciante comerciante;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            CircleAvatar(
              radius: 20, // Image radius
              backgroundImage: NetworkImage(
                  'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/restaurant-logo-design-template-b281aeadaa832c28badd72c1f6c5caad_screen.jpg'),
            ),
            Text(
              "Panaderia El buen gusto",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Container(
          height: 240,
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
                scrollDirection: Axis.horizontal,
                children: x.map((p) => Articulo(publicacion: p)).toList(),
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
