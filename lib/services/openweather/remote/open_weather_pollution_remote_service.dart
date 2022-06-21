import 'package:flutter_template/services/entity/openWeather/remote_pollution_current_weather.dart';

abstract class OpenWeatherPollutionRemoteService {
  Future<PollutionInfo> getPollutionInfo(
      {required String latitude, required String longitude});
}
