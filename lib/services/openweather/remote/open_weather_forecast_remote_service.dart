import 'package:flutter_template/services/entity/openWeather/remote_forecast_openweather.dart';

abstract class OpenWeatherForecastRemoteService {
  Future<GetWeatherForecast> getForecast(
      {required String latitude, required String longitude});
}
