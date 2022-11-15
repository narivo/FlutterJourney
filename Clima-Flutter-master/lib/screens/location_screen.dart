import 'dart:ui';

import 'package:clima/screens/city_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

import 'package:clima/services/weather_fetcher.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});

  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    if (weatherData == null) {
      weather = WeatherModel(
        temperature: 0,
        condition: 0,
        cityName: 'Unknown',
      );
      return;
    }
    double temperature = weatherData['main']['temp'];
    int condition = weatherData['weather'][0]['id'];
    String cityName = weatherData['name'];

    weather = WeatherModel(
      temperature: temperature,
      condition: condition,
      cityName: cityName,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/weathering_with_you.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.8),
              BlendMode.dstATop,
            ),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 7.0),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      TextButton(
                        onPressed: () async {
                          try {
                            var weatherData =
                                await WeatherFetcher().getLocationWeather();
                            setState(() {
                              updateUI(weatherData);
                            });
                          } catch (e) {
                            setState(() {
                              updateUI(null);
                            });
                          }
                        },
                        child: Icon(
                          Icons.near_me,
                          size: 25.0,
                          color: Colors.white,
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          var typedName = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return CityScreen();
                              },
                            ),
                          );
                          if (typedName != null) {
                            EasyLoading.show(
                              status: 'searching...',
                              maskType: EasyLoadingMaskType.black,
                            );
                            var weatherData = await WeatherFetcher()
                                .getCityWeather(typedName);
                            EasyLoading.dismiss();
                            setState(() {
                              updateUI(weatherData);
                            });
                          }
                        },
                        child: Icon(
                          Icons.location_city,
                          size: 25.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '${weather.getTemperature().toInt()}°',
                          style: kTempTextStyle,
                        ),
                        Expanded(
                          child: Text(
                            '${weather.getWeatherIcon()}',
                            textAlign: TextAlign.center,
                            style: kConditionTextStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.only(right: 15.0),
                    child: Text(
                      "${weather.getMessage()}",
                      textAlign: TextAlign.right,
                      style: kMessageTextStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
