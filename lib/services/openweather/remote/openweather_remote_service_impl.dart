import 'package:dio/dio.dart';
import 'package:flutter_template/presentation/destinations/openweather/home/main_home_view_model_impl.dart';
import 'package:flutter_template/services/entity/openWeather/remote_current_weather_openweather.dart';
import 'package:flutter_template/services/openweather/remote/openweather_remote_service.dart';

class OpenWeatherRemoteServiceImpl implements OpenWeatherRemoteService {
  final Dio dio;

  OpenWeatherRemoteServiceImpl({
    required this.dio,
  });

  @override
  Future<CurrentWeatherOpenWeather> searchCity(
      {required String cityName}) async {
    final queryParam = {
      'q': cityName,
      'units': units,
      'lang': language,
    };

    final response = await dio.get(
      'data/2.5/weather',
      queryParameters: queryParam,
    );

    return CurrentWeatherOpenWeather.fromJson(response.data);
  }
}
