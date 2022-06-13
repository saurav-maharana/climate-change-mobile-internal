import 'dart:async';
import 'package:flutter_template/domain/entity/openweather/current_weather.dart';
import 'package:flutter_template/domain/openweather/current_weather_openweather_usecase.dart';
import 'package:flutter_template/foundation/logger/logger.dart';
import 'package:flutter_template/interactor/openweather/openweather_interactor.dart';
import 'package:flutter_template/foundation/extensions/object_ext.dart';

class OpenWeatherInteractorImpl extends OpenWeatherInteractor {
  final CurrentWeatherUseCase currentWeatherUseCase;
  final List<CurrentWeather> _currentWeatherList = [];

  OpenWeatherInteractorImpl({
    required this.currentWeatherUseCase,
  });

  @override
  Future<void> search(String cityName) async {
    final searchResults = await currentWeatherUseCase(param: cityName);
    searchResults.when(
      success: (data) {
        _currentWeatherList.add(data);
      },
      error: (e) => log.e(
          "SearchCityInteractorImpl: search for $cityName returned error ${e?.toString()}"),
    );
  }
}
