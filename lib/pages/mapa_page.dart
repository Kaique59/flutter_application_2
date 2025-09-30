import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class Localiza {
  String nome;
  LatLng coordenadas;

  Localiza({required this.nome, required this.coordenadas});
}

class _MapPageState extends State<MapPage> {
  final LatLng _localInicial = LatLng(-23.528051449701543, -46.69176221492009);

  final List<Localiza> lugares = [
    Localiza(
      nome: "Senac Tito",
      coordenadas: LatLng(-23.528051449701543, -46.69176221492009),
    ),
    Localiza(
      nome: "Senac Francisco Matarazzo",
      coordenadas: LatLng(-23.524918273948497, -46.667361060239166),
    ),
    Localiza(
      nome: "Minha Casa",
      coordenadas: LatLng(-23.536087274336733, -46.65580590461865),
    ),
    Localiza(
      nome: "Museu do Futebol",
      coordenadas: LatLng(-23.547505126838367, -46.66519540859618),
    ),
    Localiza(
      nome: "Parque da Água Branca",
      coordenadas: LatLng(-23.530458455833056, -46.67007412208918),
    ),
  ];

  final List<Color> cores = [
    Colors.red,
    Colors.yellow,
    Colors.blue,
    Colors.green,
    Colors.orange,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mapa Interativo"),
        backgroundColor: Colors.white,
      ),
      body: FlutterMap(
        options: MapOptions(initialCenter: _localInicial, initialZoom: 14),
        children: [
          TileLayer(
            urlTemplate:
                'https://api.maptiler.com/maps/basic/{z}/{x}/{y}.png?key=DVlnMZzGhLBeh6qgbJWR',
          ),
          MarkerLayer(
            markers: [
              for (int i = 0; i < lugares.length; i++)
                Marker(
                  point: lugares[i].coordenadas,
                  width: 80,
                  height: 80,
                  child: Icon(Icons.location_on, color: cores[i], size: 40),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
