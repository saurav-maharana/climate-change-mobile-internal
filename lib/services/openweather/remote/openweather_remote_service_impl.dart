import 'package:dio/dio.dart';
import 'package:flutter_template/services/entity/openWeather/remote_current_weather_openweather.dart';
import 'package:flutter_template/services/openweather/remote/openweather_remote_service.dart';
import 'package:flutter_template/foundation/extensions/object_ext.dart';

class OpenWeatherRemoteServiceImpl implements OpenWeatherRemoteService {
  final Dio dio;

  OpenWeatherRemoteServiceImpl({
    required this.dio,
  });

  @override
  Future<CurrentWeatherOpenWeather> searchCity({required String cityName}) async {
    final response = await dio.get(
      'data/2.5/weather?q=$cityName&units=metric',
    );
    logD("Response from Service :: $response");

    return CurrentWeatherOpenWeather.fromJson(response.data);
  }
}
