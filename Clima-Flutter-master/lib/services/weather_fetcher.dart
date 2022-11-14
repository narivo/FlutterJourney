import 'package:clima/services/location.dart';
import 'networking.dart';

const weatherApiKey = '1e8b1e90c25c8b4c1aa6ee704a9d0d86';
final baseUri = Uri(
  scheme: 'https',
  host: 'api.openweathermap.org',
  path: 'data/2.5/weather',
);

class WeatherFetcher {
  double _longitude = 0.0;
  double _latitude = 0.0;

  Future getLocationWeather() async {
    await _getLocation();
    var weatherData = await _getWeather();
    return weatherData;
  }

  Future _getLocation() async {
    Location location = Location();
    await location.getCurrent();
    _latitude = location.getLatitude();
    _longitude = location.getLongitude();
  }

  Future _getWeather() async {
    var weatherUri = baseUri.replace(queryParameters: {
      'lat': '$_latitude',
      'lon': '$_longitude',
      'appid': weatherApiKey,
      'units': 'metric',
    });

    NetworkHelper networkHelper = NetworkHelper(weatherUri);
    return await networkHelper.getData();
  }
}
