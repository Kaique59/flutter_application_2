import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<Position?> getCurrentLocation() async {
    //Verificar se o serviço esta abilitado.
    bool servicesEnable = await Geolocator.isLocationServiceEnabled();

    if (!servicesEnable) {
      print("Serviço de localização desativado. Habilite a sua localização.");
      return null;
    }

    //Verificar se temos permição de obter a localização.
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        print("Permissão negda");
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      print("Senta e chora... não temos localização");
      return null;
    }

    Position position = await Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(accuracy: LocationAccuracy.best),
    );

    return position;
  }
}
