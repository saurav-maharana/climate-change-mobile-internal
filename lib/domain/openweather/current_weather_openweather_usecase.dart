import 'package:flutter_template/domain/base/usecase/base_async_use_case.dart';
import 'package:flutter_template/domain/entity/openweather/current_weather.dart';

abstract class CurrentWeatherUseCase
    extends BaseAsyncUseCase<String, CurrentWeather> {}
