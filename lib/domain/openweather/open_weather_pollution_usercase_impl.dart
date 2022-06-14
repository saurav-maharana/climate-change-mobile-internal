import 'package:flutter_template/domain/entity/openweather/pollution_info.dart';
import 'package:flutter_template/domain/openweather/open_weather_pollution_usecase.dart';
import 'package:flutter_template/repository/openweather/open_weather_pollution_repository.dart';

class OpenWeatherPollutionUsecaseImpl extends OpenWeatherPollutionUseCase {
  final OpenWeatherPollutionRepository openWeatherPollutionRepository;

  OpenWeatherPollutionUsecaseImpl({
    required this.openWeatherPollutionRepository,
  });

  @override
  Future<OpenWeatherPollutionInfo> callInternal(String param) async {
    return await openWeatherPollutionRepository.getPollutionInfo(
      "23",
      "12",
      // ignore: todo
    ); // TODO: Remove the hardcoded values
  }
}
