import 'package:flutter_template/domain/entity/openweather/weather_forecast.dart';
import 'package:flutter_template/repository/openweather/domain_openweather_forecast_mapper.dart';
import 'package:flutter_template/repository/openweather/open_weather_forecast_repository.dart';
import 'package:flutter_template/services/openweather/remote/open_weather_forecast_remote_service.dart';

class OpenWeatherForecastRepositoryImpl
    implements OpenWeatherForecastRepository {
  OpenWeatherForecastRemoteService openWeatherForecastRemoteService;
  DomainOpenWeatherForecastMapper domainOpenWeatherForecastMapper;

  OpenWeatherForecastRepositoryImpl({
    required this.openWeatherForecastRemoteService,
    required this.domainOpenWeatherForecastMapper,
  });

  @override
  Future<OpenWeatherForecast> getForecast(
      String latitude, String longitude) async {
    final results = await openWeatherForecastRemoteService.getForecast(
        latitude: latitude, longitude: longitude);

    return domainOpenWeatherForecastMapper.map(results);
  }
}
