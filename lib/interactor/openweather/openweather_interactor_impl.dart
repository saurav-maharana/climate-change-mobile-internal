import 'dart:async';
import 'package:flutter_template/domain/entity/openweather/current_weather.dart';
import 'package:flutter_template/domain/openweather/current_weather_openweather_usecase.dart';
import 'package:flutter_template/interactor/openweather/openweather_interactor.dart';
import 'package:flutter_template/foundation/extensions/object_ext.dart';

class OpenWeatherInteractorImpl extends OpenWeatherInteractor {
  final CurrentWeatherUseCase currentWeatherUseCase;

  OpenWeatherInteractorImpl({
    required this.currentWeatherUseCase,
  });

  @override
  Future<CurrentWeather> search(String cityName) async {
    final searchResults = await currentWeatherUseCase(param: cityName);
    return searchResults.when(
      success: (data) {
        return data;
      },
      error: (e) => "$e" as CurrentWeather,
    );
  }
}
