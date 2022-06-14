import 'package:flutter_template/domain/entity/openweather/pollution_info.dart';
import 'package:flutter_template/services/entity/openWeather/remote_pollution_current_weather.dart';

abstract class OpenWeatherPollutionRepository {
  Future<OpenWeatherPollutionInfo> getPollutionInfo(
      String latitude, String longitude);
}
