import 'package:flutter_template/domain/entity/openweather/weather_forecast.dart';
import 'package:flutter_template/domain/openweather/open_weather_forecast_usecase.dart';
import 'package:flutter_template/interactor/openweather/openweather_forecast_interactor.dart';
import 'package:tuple/tuple.dart';

class OpenWeatherForecastInteractorImpl extends OpenWeatherForecastInteractor {
  final OpenWeatherForecastUseCase openWeatherForecastUseCase;

  OpenWeatherForecastInteractorImpl({
    required this.openWeatherForecastUseCase,
  });

  @override
  Future<OpenWeatherForecast> getForecast(
      String latitude, String longitude) async {
    final searchResults =
        await openWeatherForecastUseCase(param: Tuple2(longitude, latitude));

    return searchResults.when(
      success: (data) => data,
      error: (e) => "$e" as OpenWeatherForecast,
    );
  }
}
