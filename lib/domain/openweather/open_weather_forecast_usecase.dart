import 'package:flutter_template/domain/base/usecase/base_async_use_case.dart';
import 'package:flutter_template/domain/entity/openweather/weather_forecast.dart';
import 'package:tuple/tuple.dart';

abstract class OpenWeatherForecastUseCase
    extends BaseAsyncUseCase<Tuple2<String, String>, OpenWeatherForecast> {}
