import 'package:flutter_template/domain/base/usecase/base_async_use_case.dart';
import 'package:flutter_template/domain/entity/openweather/pollution_info.dart';
import 'package:tuple/tuple.dart';

abstract class OpenWeatherPollutionUseCase
    extends BaseAsyncUseCase<Tuple2<String, String>, OpenWeatherPollutionInfo> {
}
