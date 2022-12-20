import "package:flutter/material.dart";

import 'articulo.dart';

class Tienda extends StatelessWidget {
  const Tienda({Key? key}) : super(key: key);

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
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Articulo(),
              SizedBox(
                width: 10,
              ),
              Articulo()
            ],
          ),
        ),
      ],
    );
  }
}
