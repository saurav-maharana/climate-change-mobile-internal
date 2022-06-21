import 'package:dio/dio.dart';
import 'package:flutter_template/services/entity/openWeather/remote_pollution_current_weather.dart';

import 'open_weather_pollution_remote_service.dart';

class OpenWeatherPollutionRemoteServiceImpl
    implements OpenWeatherPollutionRemoteService {
  final Dio dio;

  OpenWeatherPollutionRemoteServiceImpl({
    required this.dio,
  });

  @override
  Future<PollutionInfo> getPollutionInfo(
      {required String latitude, required String longitude}) async {
    final pollutionResponse = await dio.get(
      'data/2.5/air_pollution?lat=$latitude&lon=$longitude',
    );

    return PollutionInfo.fromJson(pollutionResponse.data);
  }
}
