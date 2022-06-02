import 'package:flutter_template/foundation/extensions/object_ext.dart';
import 'package:flutter_template/repository/openweather/open_weather_repository.dart';
import 'package:flutter_template/services/openweather/remote/openweather_remote_service.dart';

class OpenWeatherRepositoryImpl implements OpenWeatherRepository {
  final OpenWeatherRemoteService openWeatherRemoteService;

  OpenWeatherRepositoryImpl({
    required this.openWeatherRemoteService,
  });

  @override
  Future searchCity(String searchCityName) async {
    logD("Search city Name: $searchCityName");

    final results =
        await openWeatherRemoteService.searchCity(cityName: searchCityName);

    logD("Results from Repo : $results");

    return results;
  }
}
