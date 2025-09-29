import 'package:flutter/material.dart';
import 'package:flutter_application_1/Services/location_service.dart';
import 'package:geolocator/geolocator.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  LocationService locationService = LocationService();
  String statusLocalizacao = "Sem Localização";

  Future<void> getLocation() async {
    Position? position = await locationService.getCurrentLocation();

    if (position != null) {
      setState(() {
        statusLocalizacao =
            "Latitude: ${position.latitude}\n Longitude: ${position.longitude} ";
      });
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          spacing: 40,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(statusLocalizacao),
            ElevatedButton(
              onPressed: getLocation,
              child: Text("Obter localização"),
            ),
          ],
        ),
      ),
    );
  }
}
