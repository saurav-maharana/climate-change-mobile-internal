import 'package:flutter_template/domain/openweather/current_weather_openweather_usecase.dart';
import 'package:flutter_template/interactor/openweather/openweather_interactor.dart';

class OpenWeatherInteractorImpl extends OpenWeatherInteractor {
  final CurrentWeatherUseCase currentWeatherUseCase;

  OpenWeatherInteractorImpl({
    required this.currentWeatherUseCase,
    required this.listName,
  });

  List listName;

  @override
  Future<void> search(String cityName) async {
    final searchResults = await currentWeatherUseCase(param: cityName);

    searchResults.when(
      success: (data) => listName.add(data),
      error: (e) =>
          "SearchCityInteractorImpl: search for $cityName returned error ${e?.toString()}",
    );
  }
}
