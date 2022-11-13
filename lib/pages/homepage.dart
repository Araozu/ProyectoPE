import "package:flutter/material.dart";

import '../routes/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
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
              SizedBox(
                  height: 40,
                  child: ListView(
                    padding: const EdgeInsets.all(8),
                    scrollDirection: Axis.horizontal,
                    children: const [
                      Text("Comidas"),
                      Text(
                        "Pan",
                        style: TextStyle(
                            color: Colors.red,
                            decoration: TextDecoration.underline),
                      ),
                      Text("Bebidas"),
                      Text("Provisiones"),
                      Text("Pasteles"),
                      Text("Verduras"),
                    ],
                  )),
              Tienda(),
              Tienda(),
            ]),
      )),
    );
  }
}

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

class Articulo extends StatelessWidget {
  const Articulo({Key? key}) : super(key: key);

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
                          backgroundImage: NetworkImage(
                              'https://www.melskitchencafe.com/wp-content/uploads/rustic-bread-updated2-600x900.jpg'),
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Quedan 30",
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text(
                  "Pan Frances",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "-20%",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      "S/. 0.5",
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                    Spacer(
                      flex: 5,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "S/. 0.3 U",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                )
              ],
            )),
      )
    ]);
  }
}
