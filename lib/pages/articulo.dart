import "package:flutter/material.dart";

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
