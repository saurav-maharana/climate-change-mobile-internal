import 'package:flutter_template/domain/entity/openweather/current_weather.dart';

abstract class OpenWeatherInteractor {
  Future<CurrentWeather> search(String cityName);
}
