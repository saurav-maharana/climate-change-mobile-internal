import 'package:flutter_template/domain/entity/openweather/current_weather.dart';
import 'package:flutter_template/domain/openweather/current_weather_openweather_usecase.dart';
import 'package:flutter_template/repository/openweather/open_weather_repository.dart';

class CurrentWeatherUseCaseImpl extends CurrentWeatherUseCase {
  OpenWeatherRepository openWeatherRepository;

  CurrentWeatherUseCaseImpl({
    required this.openWeatherRepository,
  });

  @override
  Future<CurrentWeather> callInternal(String param) async {
    return openWeatherRepository.searchCity(param);
  }
}
