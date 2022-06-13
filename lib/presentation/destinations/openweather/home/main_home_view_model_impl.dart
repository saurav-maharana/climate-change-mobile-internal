import 'dart:async';

import 'package:flutter_template/presentation/destinations/openweather/home/home_screen_intent.dart';
import 'package:flutter_template/presentation/destinations/openweather/home/home_screen_state.dart';
import 'package:flutter_template/presentation/destinations/openweather/home/main_home_view_model.dart';
import 'package:flutter_template/presentation/entity/base/ui_toolbar.dart';
import '../../../../domain/entity/openweather/current_weather.dart';
import '../../../../interactor/openweather/openweather_interactor.dart';

class OpenWeatherViewModelImpl extends OpenWeatherViewModel {
  final OpenWeatherInteractor openWeatherInteractor;

  OpenWeatherViewModelImpl({
    required this.openWeatherInteractor,
  }) : super(_initialState);

  @override
  onInit() {
    CurrentWeather(
        cityName: "",
        description: "",
        currentTemperature: 0.0,
        feelsLike: 0.0,
        maximumTemperature: 0.0,
        minimumTemperature: 0.0,
        presssure: 0.0,
        humidity: 0.0,
        visibility: 0.0,
        windSpeed: 0.0);
    openWeatherInteractor.search('');
  }

  static OpenWeatherHomeScreenState get _initialState =>
      OpenWeatherHomeScreenState(
          currentWeatherValue: StreamController.broadcast(),
          toolbar: UIToolbar(
            title: "",
            hasBackButton: false,
          ),
          showLoading: false);

  @override
  void onIntent(OpenWeatherHomeIntent intent) {
    intent.when(search: (cityName) {
      openWeatherInteractor.search(cityName);
    });
  }
}
