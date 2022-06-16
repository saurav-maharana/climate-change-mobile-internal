import 'package:flutter_template/domain/entity/openweather/weather_forecast.dart';
import 'package:flutter_template/presentation/entity/base/ui_toolbar.dart';
import 'package:flutter_template/presentation/entity/screen/screen_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'forecast_screen_state.freezed.dart';

@freezed
class OpenWeatherForecastScreenState
    with _$OpenWeatherForecastScreenState
    implements ScreenState {
  factory OpenWeatherForecastScreenState({
    required OpenWeatherForecast openWeatherForecast,
    required UIToolbar toolbar,
    required bool showLoading,
  }) = _OpenWeatherForecastScreenState;
}
