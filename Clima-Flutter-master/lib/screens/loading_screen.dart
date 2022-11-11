import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getData() async {
    var weatherUri = Uri(
        scheme: 'https',
        host: 'api.openweathermap.org',
        path: 'data/2.5/weather');
    Response response = await get(
      weatherUri,
      headers: {
        'lat': '37.42342342342342',
        'lon': '-122.08395287867832',
        'appid': '1e8b1e90c25c8b4c1aa6ee704a9d0d86',
      },
    );
    print(response.body);
  }

  @override
  void initState() {
    super.initState();
    Location(
      onLocationReady: (
        double latitude,
        double longitude,
      ) {
        print('$latitude, $longitude');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}
