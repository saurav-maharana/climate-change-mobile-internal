import 'package:flutter_template/domain/entity/openweather/pollution_info.dart';
import 'package:flutter_template/presentation/entity/base/ui_toolbar.dart';
import 'package:flutter_template/presentation/entity/screen/screen_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pollution_screen_state.freezed.dart';

@freezed
class PollutionScreenState with _$PollutionScreenState implements ScreenState {
  factory PollutionScreenState({
    required OpenWeatherPollutionInfo openWeatherPollutionInfo,
    required UIToolbar toolbar,
    required bool showLoading,
  }) = _PollutionScreenState;
}
