import 'package:dio/dio.dart';
import 'package:flutter_template/presentation/destinations/openweather/forecast/forecast.dart';
import 'package:flutter_template/services/entity/openWeather/remote_forecast_openweather.dart';
import 'package:flutter_template/services/openweather/remote/open_weather_forecast_remote_service.dart';

class OpenWeatherForecastRemoteServiceImpl
    extends OpenWeatherForecastRemoteService {
  final Dio dio;

  OpenWeatherForecastRemoteServiceImpl({
    required this.dio,
  });

  @override
  Future<GetWeatherForecast> getForecast(
      {required String latitude, required String longitude}) async {
    final forecastResponse = await dio.get(
        'data/2.5/onecall?lat=$latitude&lon=$longitude&units=metric&exclude=current,hourly,minutely,alert');

    return GetWeatherForecast.fromJson(
        forecastResponse.data as Map<String, dynamic>);
  }
}
