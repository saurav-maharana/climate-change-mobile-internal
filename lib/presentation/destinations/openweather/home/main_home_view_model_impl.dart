import 'package:flutter_template/domain/entity/openweather/current_weather.dart';
import 'package:flutter_template/presentation/destinations/openweather/home/home_screen_intent.dart';
import 'package:flutter_template/presentation/destinations/openweather/home/home_screen_state.dart';
import 'package:flutter_template/presentation/destinations/openweather/home/main_home_view_model.dart';
import 'package:flutter_template/presentation/entity/base/ui_toolbar.dart';
import '../../../../interactor/openweather/openweather_interactor.dart';
import 'package:flutter_template/foundation/extensions/object_ext.dart';

class OpenWeatherViewModelImpl extends OpenWeatherViewModel {
  final OpenWeatherInteractor openWeatherInteractor;

  OpenWeatherViewModelImpl({
    required this.openWeatherInteractor,
  }) : super(_initialState);

  @override
  onInit() {
  }

  static OpenWeatherHomeScreenState get _initialState =>
      OpenWeatherHomeScreenState(
        currentWeather: CurrentWeather(
          cityName: "",
          description: "",
          currentTemperature: 0.0,
          feelsLike: 0.0,
          maximumTemperature: 0.0,
          minimumTemperature: 0.0,
          presssure: 000,
          humidity: 0.0,
          visibility: 0,
          windSpeed: 0,
        ),
        toolbar: UIToolbar(
          title: "",
          hasBackButton: false,
        ),
        showLoading: false,
      );

  @override
  void onIntent(OpenWeatherHomeIntent intent) {
    intent.when(search: (cityName) async {
      final result = await openWeatherInteractor.search(cityName);
      setState((state) => state.copyWith(currentWeather: result));
    });
  }
}
