import 'package:flutter_template/domain/entity/openweather/current_weather.dart';
import 'package:flutter_template/foundation/mapper/mapper.dart';
import 'package:flutter_template/services/entity/openWeather/remote_current_weather_openweather.dart';

abstract class DomainOpenWeatherMapper
    extends Mapper<CurrentWeatherOpenWeather, CurrentWeather> {}

class DomainOpenWeatherMapperImpl extends DomainOpenWeatherMapper {
  @override
  CurrentWeather map(CurrentWeatherOpenWeather from) {
    return CurrentWeather(
      cityName: from.cityName,
      description: from.weatherIconDesc.description,
      currentTemperature: from.temperatureInfo.temperature,
      feelsLike: from.temperatureInfo.feelsLike,
      maximumTemperature: from.temperatureInfo.maxTemp,
      minimumTemperature: from.temperatureInfo.minTemp,
      presssure: from.temperatureInfo.pressure,
      humidity: from.temperatureInfo.humidity,
      visibility: from.visibility,
      windSpeed: from.windSpeed.windSpeed,
    );
  }
}
