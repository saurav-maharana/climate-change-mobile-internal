import 'package:flutter_template/presentation/entity/intent/intent.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_screen_intent.freezed.dart';

@freezed
class OpenWeatherHomeIntent with _$OpenWeatherHomeIntent implements BaseIntent {
  factory OpenWeatherHomeIntent.search({required String searchTerm}) =
      _OpenWeatherHomeIntent_Search;
}
