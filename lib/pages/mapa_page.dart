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
    Colors.black,
    Colors.grey,
    Colors.white,
    Colors.green,
    Colors.blue,
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
                'https://api.maptiler.com/maps/basic/{z}/{x}/{y}.png?key=XnDpKFNCzaKP1oNvy97g',
          ),
          MarkerLayer(
            markers: [
              for (int i = 0; i < lugares.length; i++)
                Marker(
                  point: lugares[i].coordenadas,
                  width: 80,
                  height: 80,
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: cores[i],
                                  size: 40,
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  lugares[i].nome,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text("Fechar"),
                              ),
                            ],
                          );
                        },
                      );
                    },

                    child: Icon(Icons.location_on, color: cores[i], size: 40),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
