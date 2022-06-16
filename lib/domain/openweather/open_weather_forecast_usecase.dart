import 'package:flutter_template/domain/base/usecase/base_async_use_case.dart';
import 'package:flutter_template/domain/entity/openweather/weather_forecast.dart';

abstract class OpenWeatherForecastUseCase
    extends BaseAsyncUseCase<String, OpenWeatherForecast> {}
