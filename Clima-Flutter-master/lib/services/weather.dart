class WeatherModel {
  double _temperature = 0.0;
  int _condition = 0;
  String _cityName = '';

  WeatherModel({
    double temperature = 0.0,
    int condition = 0,
    String cityName = '',
  }) {
    _temperature = temperature;
    _condition = condition;
    _cityName = cityName;
  }

  double getTemperature() {
    return _temperature;
  }

  String getWeatherIcon() {
    if (_condition < 300) {
      return '🌩';
    } else if (_condition < 400) {
      return '🌧';
    } else if (_condition < 600) {
      return '☔️';
    } else if (_condition < 700) {
      return '☃️';
    } else if (_condition < 800) {
      return '🌫';
    } else if (_condition == 800) {
      return '☀️';
    } else if (_condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage() {
    if (_temperature > 25) {
      return 'It\'s 🍦 time in $_cityName';
    } else if (_temperature > 20) {
      return 'Time for shorts and 👕 in $_cityName';
    } else if (_temperature < 10) {
      return 'You\'ll need 🧣 and 🧤 in $_cityName';
    } else {
      return 'Bring a 🧥 just in case in $_cityName';
    }
  }
}
