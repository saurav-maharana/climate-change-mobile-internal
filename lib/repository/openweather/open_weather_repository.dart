import 'package:flutter_template/domain/entity/openweather/current_weather.dart';

abstract class OpenWeatherRepository {
  Future<CurrentWeather> searchCity(String searchCityName);
}
