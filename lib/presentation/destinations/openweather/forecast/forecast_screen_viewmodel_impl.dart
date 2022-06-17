import 'package:flutter_template/domain/entity/openweather/weather_forecast.dart';
import 'package:flutter_template/foundation/extensions/object_ext.dart';
import 'package:flutter_template/interactor/openweather/openweather_forecast_interactor.dart';
import 'package:flutter_template/presentation/destinations/openweather/forecast/forecast_screen_intent.dart';
import 'package:flutter_template/presentation/destinations/openweather/forecast/forecast_screen_state.dart';
import 'package:flutter_template/presentation/destinations/openweather/forecast/forecast_screen_viewmodel.dart';
import 'package:flutter_template/presentation/destinations/openweather/home/main_home_view_model_impl.dart';
import 'package:flutter_template/presentation/entity/base/ui_toolbar.dart';
import 'package:geocoding/geocoding.dart';

class OpenWeatherForecastViewModelImpl extends OpenWeatherForecastViewModel {
  OpenWeatherForecastInteractor openWeatherForecastInteractor;
  double latitude = 0.0;
  double longitude = 0.0;

  OpenWeatherForecastViewModelImpl({
    required this.openWeatherForecastInteractor,
  }) : super(_initState);

  @override
  onInit() async {
    await GeocodingPlatform.instance
        .locationFromAddress(globalCityName)
        .then((value) => {
              latitude = value[0].latitude,
              longitude = value[0].longitude,
            });

    final result = await openWeatherForecastInteractor.getForecast(
        latitude.toString(), longitude.toString());
    setState((state) => state.copyWith(openWeatherForecast: result));
  }

  static OpenWeatherForecastScreenState get _initState =>
      OpenWeatherForecastScreenState(
        openWeatherForecast: OpenWeatherForecast(weatherForecast: List.empty()),
        toolbar: UIToolbar(title: "", hasBackButton: false),
        showLoading: false,
      );

  @override
  void onIntent(OpenWeatherForecastIntent intent) async {
    await GeocodingPlatform.instance
        .locationFromAddress(globalCityName)
        .then((value) => {
              latitude = value[0].latitude,
              longitude = value[0].longitude,
            });

    intent.when(search: (globalCityName) async {
      final result = await openWeatherForecastInteractor.getForecast(
          latitude.toString(), longitude.toString());

      setState((state) => state.copyWith(openWeatherForecast: result));
    });
  }
}
