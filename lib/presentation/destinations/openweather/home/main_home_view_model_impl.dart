import 'package:flutter_template/domain/entity/openweather/current_weather.dart';
import 'package:flutter_template/presentation/destinations/openweather/home/home_screen_intent.dart';
import 'package:flutter_template/presentation/destinations/openweather/home/home_screen_state.dart';
import 'package:flutter_template/presentation/destinations/openweather/home/main_home_view_model.dart';
import 'package:flutter_template/presentation/entity/base/ui_toolbar.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import '../../../../interactor/openweather/openweather_interactor.dart';

String globalCityName = "Pune";

class OpenWeatherViewModelImpl extends OpenWeatherViewModel {
  final OpenWeatherInteractor openWeatherInteractor;
  double latitude = 0.0;
  double longitude = 0.0;

  OpenWeatherViewModelImpl({
    required this.openWeatherInteractor,
  }) : super(_initialState);

  @override
  onInit() async {
    await GeolocatorPlatform.instance.requestPermission();
    await GeolocatorPlatform.instance
        .getCurrentPosition(
            locationSettings: const LocationSettings(
      accuracy: LocationAccuracy.high,
    ))
        .then((value) {
      latitude = value.latitude;
      longitude = value.longitude;
    });

    await GeocodingPlatform.instance
        .placemarkFromCoordinates(latitude, longitude)
        .then((value) {
      globalCityName = value[0].subAdministrativeArea!;
    }).then((_) async {
      final result = await openWeatherInteractor.search(globalCityName);
      setState((state) => state.copyWith(currentWeather: result));
    });
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
      globalCityName = result.cityName;
    });
  }
}
