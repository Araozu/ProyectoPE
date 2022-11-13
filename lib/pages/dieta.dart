import "package:flutter/material.dart";
import 'package:proyecto_pe/routes/routes.dart';

class Dieta extends StatelessWidget {
  const Dieta({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dieta"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
        ),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
        child: Column(
          children: [
            const Text("Selecciona la dieta que sigues:"),
            Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Dieta"),
            Spacer(),
            Switch(value: true, onChanged: (bool value) {})
          ],
            ),
            Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Vegetariana"),
            Spacer(),
            Switch(value: true, onChanged: (bool value) {})
          ],
            ),
            Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Vegana"),
            Spacer(),
            Switch(value: true, onChanged: (bool value) {})
          ],
            ),
            Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Pais: Perú"),
            Spacer(),
            Switch(value: true, onChanged: (bool value) {})
          ],
            ),
            Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Libre de gluten"),
            Spacer(),
            Switch(value: true, onChanged: (bool value) {})
          ],
            ),
            Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Libre de lactosa"),
            Spacer(),
            Switch(value: true, onChanged: (bool value) {})
          ],
            ),
          ],
        ),
      )),
    );
  }
}
