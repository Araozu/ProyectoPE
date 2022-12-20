import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class Mapa extends StatefulWidget {
  const Mapa({Key? key, required this.lat, required this.long}) : super(key: key);

  final double lat;
  final double long;

  @override
  State<Mapa> createState() => MapaState(lat: lat, long: long);
}

class MapaState extends State<Mapa> {
  MapaState({required this.lat, required this.long});

  final double lat;
  final double long;

  late AnchorPos<dynamic> anchorPos;

  @override
  void initState() {
    super.initState();
    anchorPos = AnchorPos.align(AnchorAlign.center);
  }


  @override
  Widget build(BuildContext context) {
    final markers = <Marker>[
      Marker(
        width: 160,
        height: 160,
        point: LatLng(lat, long),
        builder: (ctx) => const Icon(Icons.pin_drop),
        anchorPos: anchorPos,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: const Text("Ubicación"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [

            Flexible(
              child: FlutterMap(
                options: MapOptions(
                  center: LatLng(lat, long),
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                    'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                  ),
                  MarkerLayer(markers: markers),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

