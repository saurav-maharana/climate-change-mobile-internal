import 'package:flutter_template/presentation/entity/intent/intent.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'forecast_screen_intent.freezed.dart';

@freezed
class OpenWeatherForecastIntent
    with _$OpenWeatherForecastIntent
    implements BaseIntent {
  factory OpenWeatherForecastIntent.search({required String cityName}) =
      _OpenWeatherForecastIntent_Search;
}
