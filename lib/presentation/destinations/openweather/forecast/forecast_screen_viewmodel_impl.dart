import 'package:flutter_template/domain/entity/openweather/weather_forecast.dart';
import 'package:flutter_template/interactor/openweather/openweather_forecast_interactor.dart';
import 'package:flutter_template/presentation/destinations/openweather/forecast/forecast_screen_intent.dart';
import 'package:flutter_template/presentation/destinations/openweather/forecast/forecast_screen_state.dart';
import 'package:flutter_template/presentation/destinations/openweather/forecast/forecast_screen_viewmodel.dart';
import 'package:flutter_template/presentation/entity/base/ui_toolbar.dart';

class OpenWeatherForecastViewModelImpl extends OpenWeatherForecastViewModel {
  OpenWeatherForecastInteractor openWeatherForecastInteractor;

  OpenWeatherForecastViewModelImpl({
    required this.openWeatherForecastInteractor,
  }) : super(_initState);

  @override
  onInit() async {
    final result = await openWeatherForecastInteractor.getForecast("12", "43");
    setState((state) => state.copyWith(openWeatherForecast: result));
  }

  @override
  void onIntent(OpenWeatherForecastIntent intent) {
    intent.when(search: (latitude, longitude) async {
      final results =
          await openWeatherForecastInteractor.getForecast("54", "32");

      setState((state) => state.copyWith(openWeatherForecast: results));
    });
  }

  static OpenWeatherForecastScreenState get _initState =>
      OpenWeatherForecastScreenState(
        openWeatherForecast: OpenWeatherForecast(weatherForecast: List.empty()),
        toolbar: UIToolbar(title: "", hasBackButton: false),
        showLoading: false,
      );
}
