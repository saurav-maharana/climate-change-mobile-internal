import 'package:flutter_template/domain/entity/openweather/weather_forecast.dart';

abstract class OpenWeatherForecastInteractor {
  Future<OpenWeatherForecast> getForecast(String latitude, String longitude);
}
