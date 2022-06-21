import 'package:flutter_template/services/entity/openWeather/remote_current_weather_openweather.dart';

abstract class OpenWeatherRemoteService {
  Future<CurrentWeatherOpenWeather> searchCity({required String cityName});
}
