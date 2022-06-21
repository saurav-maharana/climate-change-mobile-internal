import 'package:flutter_template/presentation/entity/intent/intent.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pollution_screen_intent.freezed.dart';

@freezed
class PollutionScreenIntent with _$PollutionScreenIntent implements BaseIntent {
  factory PollutionScreenIntent.searchUsingCityName(
      {required String cityName}) = _PollutionScreenIntent_SearchCityName;
}
