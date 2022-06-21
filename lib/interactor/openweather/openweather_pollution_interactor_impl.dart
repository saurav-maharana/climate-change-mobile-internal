import 'package:flutter_template/domain/entity/openweather/pollution_info.dart';
import 'package:flutter_template/domain/openweather/open_weather_pollution_usecase.dart';
import 'package:flutter_template/interactor/openweather/openweather_pollution_interactor.dart';

class OpenWeatherPollutionInteractorImpl
    extends OpenWeatherPollutionInteractor {
  OpenWeatherPollutionUseCase openWeatherPollutionUseCase;

  OpenWeatherPollutionInteractorImpl({
    required this.openWeatherPollutionUseCase,
  });

  @override
  Future<OpenWeatherPollutionInfo> getPollutionInfo(
      String latitude, String longitude) async {
    final result = await openWeatherPollutionUseCase(param: latitude);

    return result.when(
      success: (data) {
        return data;
      },
      error: (e) => "$e" as OpenWeatherPollutionInfo,
    );
  }
}
