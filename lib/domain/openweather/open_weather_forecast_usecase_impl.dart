import 'package:flutter_template/domain/entity/openweather/weather_forecast.dart';
import 'package:flutter_template/domain/openweather/open_weather_forecast_usecase.dart';
import 'package:flutter_template/repository/openweather/open_weather_forecast_repository.dart';
import 'package:tuple/tuple.dart';

class OpenWeatherForecastUseCaseImpl extends OpenWeatherForecastUseCase {
  OpenWeatherForecastRepository openWeatherForecastRepository;

  OpenWeatherForecastUseCaseImpl({
    required this.openWeatherForecastRepository,
  });

  @override
  Future<OpenWeatherForecast> callInternal(Tuple2<String, String> param) async {
    return await openWeatherForecastRepository.getForecast(
        param.item1, param.item2);
  }
}
