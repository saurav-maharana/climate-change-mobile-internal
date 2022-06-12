import 'package:flutter_template/presentation/destinations/openweather/home/home_screen_intent.dart';
import 'package:flutter_template/presentation/destinations/openweather/home/home_screen_state.dart';
import 'package:flutter_template/presentation/destinations/openweather/home/main_home_view_model.dart';
import 'package:flutter_template/presentation/entity/base/ui_toolbar.dart';
import '../../../../interactor/openweather/openweather_interactor.dart';

class OpenWeatherViewModelImpl extends OpenWeatherViewModel {
  final OpenWeatherInteractor openWeatherInteractor;

  OpenWeatherViewModelImpl({
    required this.openWeatherInteractor,
  }) : super(_initialState);

  @override
  onInit() {
    openWeatherInteractor.search('Pune');
  }

  static OpenWeatherHomeScreenState get _initialState =>
      OpenWeatherHomeScreenState(
          currentWeatherValue: List.empty(),
          toolbar: UIToolbar(
            title: "",
            hasBackButton: false,
          ),
          showLoading: false);

  @override
  void onIntent(OpenWeatherHomeIntent intent) {
    intent.when(search: (cityName) {
      openWeatherInteractor.search(cityName);
    });
  }
}
