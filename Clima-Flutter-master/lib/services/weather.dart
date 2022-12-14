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
      return '๐ฉ';
    } else if (_condition < 400) {
      return '๐ง';
    } else if (_condition < 600) {
      return 'โ๏ธ';
    } else if (_condition < 700) {
      return 'โ๏ธ';
    } else if (_condition < 800) {
      return '๐ซ';
    } else if (_condition == 800) {
      return 'โ๏ธ';
    } else if (_condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage() {
    if (_temperature > 25) {
      return 'It\'s ๐ฆ time in $_cityName';
    } else if (_temperature > 20) {
      return 'Time for shorts and ๐ in $_cityName';
    } else if (_temperature < 10) {
      return 'You\'ll need ๐งฃ and ๐งค in $_cityName';
    } else {
      return 'Bring a ๐งฅ just in case in $_cityName';
    }
  }
}
