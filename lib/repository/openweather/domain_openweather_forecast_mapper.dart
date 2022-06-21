import 'package:flutter_template/domain/entity/openweather/weather_forecast.dart';
import 'package:flutter_template/foundation/mapper/mapper.dart';
import 'package:flutter_template/services/entity/openWeather/remote_forecast_openweather.dart';

abstract class DomainOpenWeatherForecastMapper
    extends Mapper<GetWeatherForecast, OpenWeatherForecast> {}

class DomainOpenWeatherForecastMapperImpl
    extends DomainOpenWeatherForecastMapper {
  @override
  OpenWeatherForecast map(GetWeatherForecast from) {
    return OpenWeatherForecast(
      weatherForecast: from.weatherForecast,
    );
  }
}
