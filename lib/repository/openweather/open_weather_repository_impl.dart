import 'package:flutter_template/domain/entity/openweather/current_weather.dart';
import 'package:flutter_template/repository/openweather/open_weather_repository.dart';
import 'package:flutter_template/services/openweather/remote/openweather_remote_service.dart';
import 'package:flutter_template/repository/openweather/domain_openweather_mapper.dart';

class OpenWeatherRepositoryImpl implements OpenWeatherRepository {
  final OpenWeatherRemoteService openWeatherRemoteService;
  final DomainOpenWeatherMapper domainOpenWeatherMapper;

  OpenWeatherRepositoryImpl({
    required this.openWeatherRemoteService,
    required this.domainOpenWeatherMapper,
  });

  @override
  Future<CurrentWeather> searchCity(String searchCityName) async {
    final results =
        await openWeatherRemoteService.searchCity(cityName: searchCityName);

    return domainOpenWeatherMapper.map(results);
  }
}
