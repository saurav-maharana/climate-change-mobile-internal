import 'package:flutter_template/domain/entity/openweather/pollution_info.dart';
import 'package:flutter_template/interactor/openweather/openweather_pollution_interactor.dart';
import 'package:flutter_template/presentation/destinations/openweather/pollution/pollution_screen_intent.dart';
import 'package:flutter_template/presentation/destinations/openweather/pollution/pollution_screen_state.dart';
import 'package:flutter_template/presentation/destinations/openweather/pollution/pollution_screen_viewmodel.dart';
import 'package:flutter_template/presentation/entity/base/ui_toolbar.dart';

class PollutionScreenViewModelImpl extends PollutionScreenViewModel {
  OpenWeatherPollutionInteractor openWeatherPollutionInteractor;

  PollutionScreenViewModelImpl({
    required this.openWeatherPollutionInteractor,
  }) : super(_initState);

  @override
  onInit() {}

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
  void onIntent(PollutionScreenIntent intent) {}
}
