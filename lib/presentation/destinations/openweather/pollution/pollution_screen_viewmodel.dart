import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/presentation/base/intent/intent_handler.dart';
import 'package:flutter_template/presentation/base/view_model_provider/base_view_model.dart';
import 'package:flutter_template/presentation/destinations/openweather/pollution/pollution_screen_intent.dart';
import 'package:flutter_template/presentation/destinations/openweather/pollution/pollution_screen_state.dart';
import 'package:flutter_template/presentation/entity/screen/screen.dart';
import 'package:get_it/get_it.dart';

final pollutionScreenViewModel = StateNotifierProvider.autoDispose<
    PollutionScreenViewModel, PollutionScreenState>((ref) => GetIt.I.get());

abstract class PollutionScreenViewModel
    extends BaseViewModel<OpenWeatherPollutionScreen, PollutionScreenState>
    implements IntentHandler<PollutionScreenIntent> {
  PollutionScreenViewModel(PollutionScreenState state) : super(state);
}
