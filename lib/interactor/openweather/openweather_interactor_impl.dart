import 'dart:async';
import 'package:flutter_template/domain/entity/openweather/current_weather.dart';
import 'package:flutter_template/domain/openweather/current_weather_openweather_usecase.dart';
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
        logD('Data :: $data'); // returns instance of CurrentWeather
        _currentWeatherList.add(data);
        logD('$_currentWeatherList'); // returns List<CurrentWeather>
      },
      error: (e) => "$e",
    );
  }
}
