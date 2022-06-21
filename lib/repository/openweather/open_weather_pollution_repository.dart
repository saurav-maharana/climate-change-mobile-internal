import 'package:flutter_template/domain/entity/openweather/pollution_info.dart';

abstract class OpenWeatherPollutionRepository {
  Future<OpenWeatherPollutionInfo> getPollutionInfo(
      String latitude, String longitude);
}
