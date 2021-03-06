import 'package:flutter_template/domain/entity/openweather/pollution_info.dart';
import 'package:flutter_template/interactor/openweather/openweather_pollution_interactor.dart';
import 'package:flutter_template/presentation/destinations/openweather/home/main_home_view_model_impl.dart';
import 'package:flutter_template/presentation/destinations/openweather/pollution/pollution_screen_intent.dart';
import 'package:flutter_template/presentation/destinations/openweather/pollution/pollution_screen_state.dart';
import 'package:flutter_template/presentation/destinations/openweather/pollution/pollution_screen_viewmodel.dart';
import 'package:flutter_template/presentation/entity/base/ui_toolbar.dart';
import 'package:geocoding/geocoding.dart';

class PollutionScreenViewModelImpl extends PollutionScreenViewModel {
  OpenWeatherPollutionInteractor openWeatherPollutionInteractor;

  PollutionScreenViewModelImpl({
    required this.openWeatherPollutionInteractor,
  }) : super(_initState);

  @override
  onInit() async {
    await GeocodingPlatform.instance
        .locationFromAddress(globalCityName)
        .then((value) {
      latitude = value[0].latitude;
      longitude = value[0].longitude;
    });
    final result = await openWeatherPollutionInteractor.getPollutionInfo(
        latitude.toString(), longitude.toString());
    setState((state) => state.copyWith(openWeatherPollutionInfo: result));
  }

  static PollutionScreenState get _initState => PollutionScreenState(
        openWeatherPollutionInfo: OpenWeatherPollutionInfo(
          airQualityIndex: 0.0,
          co: 0.0,
          no: 0.0,
          no2: 0.0,
          o3: 0.0,
          so2: 0.0,
          pm2_5: 0.0,
          pm10: 0.0,
          nh3: 0.0,
        ),
        toolbar: UIToolbar(
          title: "",
          hasBackButton: false,
        ),
        showLoading: false,
      );

  @override
  void onIntent(PollutionScreenIntent intent) async {
    await GeocodingPlatform.instance
        .locationFromAddress(globalCityName)
        .then((value) {
      latitude = value[0].latitude;
      longitude = value[0].longitude;
    });

    intent.when(searchUsingCityName: (String cityName) async {
      final result = await openWeatherPollutionInteractor.getPollutionInfo(
          latitude.toString(), longitude.toString());

      setState((state) => state.copyWith(openWeatherPollutionInfo: result));
    });
  }
}
