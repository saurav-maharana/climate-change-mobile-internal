import 'package:flutter_template/domain/base/usecase/base_async_use_case.dart';
import 'package:flutter_template/domain/entity/openweather/pollution_info.dart';

abstract class OpenWeatherPollutionUseCase
    extends BaseAsyncUseCase<String, OpenWeatherPollutionInfo> {}
