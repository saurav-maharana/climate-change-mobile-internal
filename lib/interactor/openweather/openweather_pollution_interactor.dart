import 'package:flutter_template/domain/entity/openweather/pollution_info.dart';

abstract class OpenWeatherPollutionInteractor {
  Future<OpenWeatherPollutionInfo> getPollutionInfo(
      String latitude, String longitude);
}
