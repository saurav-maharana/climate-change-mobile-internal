import 'package:flutter_template/domain/entity/openweather/pollution_info.dart';
import 'package:flutter_template/foundation/mapper/mapper.dart';
import 'package:flutter_template/services/entity/openWeather/remote_pollution_current_weather.dart';

abstract class DomainOpenWeatherPollutionMapper
    extends Mapper<PollutionInfo, OpenWeatherPollutionInfo> {}

class DomainOpenWeatherPollutionMapperImpl
    extends DomainOpenWeatherPollutionMapper {
  @override
  OpenWeatherPollutionInfo map(PollutionInfo from) {
    return OpenWeatherPollutionInfo(
      airQualityIndex: from.airQualityIndex.airQualityIndex,
      co: from.components.co,
      no: from.components.no,
      no2: from.components.no2,
      o3: from.components.o3,
      so2: from.components.so2,
      pm2_5: from.components.pm2_5,
      pm10: from.components.pm10,
      nh3: from.components.nh3,
    );
  }
}
