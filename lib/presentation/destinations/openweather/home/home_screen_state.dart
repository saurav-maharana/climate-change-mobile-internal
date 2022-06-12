import 'package:flutter_template/presentation/entity/base/ui_toolbar.dart';
import 'package:flutter_template/presentation/entity/screen/screen_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_screen_state.freezed.dart';

@freezed
class OpenWeatherHomeScreenState with _$OpenWeatherHomeScreenState implements ScreenState {
  factory OpenWeatherHomeScreenState({
    required List currentWeatherValue,
    required UIToolbar toolbar,
    required bool showLoading,
}) = _OpenWeatherHomeScreenState;
}