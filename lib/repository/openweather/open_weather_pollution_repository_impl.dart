import 'package:flutter_template/domain/entity/openweather/pollution_info.dart';
import 'package:flutter_template/repository/openweather/domain_openweather_pollution_mapper.dart';
import 'package:flutter_template/repository/openweather/open_weather_pollution_repository.dart';
import 'package:flutter_template/services/entity/openWeather/remote_pollution_current_weather.dart';
import 'package:flutter_template/services/openweather/remote/open_weather_pollution_remote_service.dart';

class OpenWeatherPollutionRepositoryImpl
    implements OpenWeatherPollutionRepository {
  final OpenWeatherPollutionRemoteService openWeatherPollutionRemoteService;
  final DomainOpenWeatherPollutionMapper domainOpenWeatherPollutionMapper;

  OpenWeatherPollutionRepositoryImpl({
    required this.openWeatherPollutionRemoteService,
    required this.domainOpenWeatherPollutionMapper,
  });

  @override
  Future<OpenWeatherPollutionInfo> getPollutionInfo(
      String latitude, String longitude) async {
    final results = await openWeatherPollutionRemoteService.getPollutionInfo(
        latitude: latitude, longitude: longitude);

    return domainOpenWeatherPollutionMapper.map(results);
  }
}
