import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Mapa extends StatefulWidget {
  const Mapa({Key? key}) : super(key: key);

  @override
  State<Mapa> createState() => MapaState();
}

class MapaState extends State<Mapa> {
  double lat = -16.4099486;
  double long = -71.5383974;

  late AnchorPos<dynamic> anchorPos;

  void init() async {
    final prefs = await SharedPreferences.getInstance();
    lat = prefs.getDouble("lat")!;
    long = prefs.getDouble("long")!;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    anchorPos = AnchorPos.align(AnchorAlign.center);
    init();
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
                  onLongPress: (pos, latlng) {

                  },
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

