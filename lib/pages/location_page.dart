import 'package:flutter/material.dart';
import 'package:flutter_application_1/Services/location_service.dart';
import 'package:geolocator/geolocator.dart';

class LocationPages extends StatefulWidget {
  const LocationPages({super.key});

  @override
  State<LocationPages> createState() => _LocationPagesState();
}

class _LocationPagesState extends State<LocationPages> {
  LocationService locationService = LocationService();
  String statusLocalizacao = "Sem localização";

  Future<void> getLocation() async {
    Position? position = await locationService.getCurrentLocation();

    if (position != null) {
      setState(() {
        statusLocalizacao =
            "Latitude: ${position.latitude}\n Longitude: ${position.longitude} ";
      });
      return;
    }
    print("deu ruim");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          spacing: 20,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(statusLocalizacao),
            ElevatedButton(
              onPressed: getLocation,
              child: Text("Obter localização."),
            ),
          ],
        ),
      ),
    );
  }
}
