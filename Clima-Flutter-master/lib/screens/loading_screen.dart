import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/services/weather_fetcher.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

const weatherApiKey = '1e8b1e90c25c8b4c1aa6ee704a9d0d86';
final baseUri = Uri(
  scheme: 'https',
  host: 'api.openweathermap.org',
  path: 'data/2.5/weather',
);

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocationData() async {
    EasyLoading.show(
      status: 'loading...',
    );

    try {
      var weatherData = await WeatherFetcher().getLocationWeather();
      dismissLoadingAndPushLocationScreen(weatherData);
    } catch (e) {
      dismissLoadingAndPushLocationScreen(null);
    }
  }

  void dismissLoadingAndPushLocationScreen(dynamic weatherData) {
    EasyLoading.dismiss();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(
            locationWeather: weatherData,
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    EasyLoading.instance..indicatorType = EasyLoadingIndicatorType.doubleBounce;
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
