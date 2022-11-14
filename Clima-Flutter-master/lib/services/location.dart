import 'package:geolocator/geolocator.dart';

class Location {
  double _latitude = 0.0;
  double _longitude = 0.0;

  Location();

  double getLatitude() {
    return _latitude;
  }

  double getLongitude() {
    return _longitude;
  }

  Future getCurrent() async {
    Position position = await _determinePosition();
    _latitude = position.latitude;
    _longitude = position.longitude;
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
  }
}
