import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  String statusLocalizacao = "Clique em um marcador";

  // Lista de locais fixos
  final List<Map<String, dynamic>> locaisFixos = const [
    {
      "nome": "Senac Francisco Matarazzo",
      "latitude": -23.524918273948497,
      "longitude": -46.667361060239166,
    },
    {
      "nome": "Minha Casa",
      "latitude": -23.536087274336733,
      "longitude": -46.65580590461865,
    },
    {
      "nome": "Museu do Futebol",
      "latitude": -23.547505126838367,
      "longitude": -46.66519540859618,
    },
    {
      "nome": "Parque da Água Branca",
      "latitude": -23.530458455833056,
      "longitude": -46.67007412208918,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mapa com Locais Fixos")),
      body: Column(
        children: [
          // Mapa ocupando metade da tela
          Expanded(
            child: FlutterMap(
              options: MapOptions(
                initialCenter: LatLng(-23.536087274336733, -46.65580590461865),
                initialZoom: 14,
              ),
              children: [
                // Camada do mapa
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                ),
                // Marcadores
                MarkerLayer(
                  markers: locaisFixos.map((local) {
                    return Marker(
                      point: LatLng(local["latitude"], local["longitude"]),
                      width: 80,
                      height: 80,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            statusLocalizacao =
                                "📍 ${local["nome"]}\nLatitude: ${local["latitude"]}\nLongitude: ${local["longitude"]}";
                          });
                        },
                        child: const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 40,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          // Texto com informações do local clicado
          Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            color: Colors.grey.shade200,
            child: Text(
              statusLocalizacao,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
