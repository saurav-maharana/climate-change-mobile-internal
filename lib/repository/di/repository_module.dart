import 'package:flutter_template/repository/date/date_mapper.dart';
import 'package:flutter_template/repository/date/date_repository.dart';
import 'package:flutter_template/repository/date/date_repository_impl.dart';
import 'package:flutter_template/repository/date/date_time_mapper.dart';
import 'package:flutter_template/repository/date/time_mapper.dart';
import 'package:flutter_template/repository/openweather/domain_openweather_forecast_mapper.dart';
import 'package:flutter_template/repository/openweather/domain_openweather_mapper.dart';
import 'package:flutter_template/repository/openweather/domain_openweather_pollution_mapper.dart';
import 'package:flutter_template/repository/openweather/open_weather_forecast_repository.dart';
import 'package:flutter_template/repository/openweather/open_weather_forecast_repository_impl.dart';
import 'package:flutter_template/repository/openweather/open_weather_pollution_repository.dart';
import 'package:flutter_template/repository/openweather/open_weather_pollution_repository_impl.dart';
import 'package:flutter_template/repository/openweather/open_weather_repository.dart';
import 'package:flutter_template/repository/openweather/open_weather_repository_impl.dart';
import 'package:flutter_template/repository/preferences/preferences_repository.dart';
import 'package:flutter_template/repository/preferences/preferences_repository_impl.dart';
import 'package:flutter_template/repository/theme/theme_repository.dart';
import 'package:flutter_template/repository/theme/theme_repository_impl.dart';
import 'package:flutter_template/repository/weather/domain_city_mapper.dart';
import 'package:flutter_template/repository/weather/domain_weather_mapper.dart';
import 'package:flutter_template/repository/weather/local_city_mapper.dart';
import 'package:flutter_template/repository/weather/local_weather_mapper.dart';
import 'package:flutter_template/repository/weather/weather_repository.dart';
import 'package:flutter_template/repository/weather/weather_repository_impl.dart';
import 'package:get_it/get_it.dart';

extension RepositoryModule on GetIt {
  void repositoryModule() {
    // date
    registerLazySingleton<DateMapper>(() => DateMapperImpl());
    registerLazySingleton<DateTimeMapper>(() => DateTimeMapperImpl());
    registerLazySingleton<TimeMapper>(() => TimeMapperImpl());

    registerLazySingleton<DateRepository>(() => DateRepositoryImpl(
          dateMapper: get(),
          timeMapper: get(),
          dateTimeMapper: get(),
        ));

    // weather
    registerFactory<DomainCityMapper>(() => DomainCityMapperImpl());

    registerFactory<DomainWeatherMapper>(() => DomainWeatherMapperImpl());

    registerFactory<LocalCityMapper>(() => LocalCityMapperImpl());

    registerFactory<LocalWeatherMapper>(
        () => LocalWeatherMapperImpl(dateRepository: get()));

    registerLazySingleton<WeatherRepository>(() => WeatherRepositoryImpl(
          weatherLocalService: get(),
          weatherRemoteService: get(),
          domainCityMapper: get(),
          domainWeatherMapper: get(),
          localCityMapper: get(),
          localWeatherMapper: get(),
          dateRepository: get(),
        ));

    // preferences
    registerLazySingleton<PreferencesRepository>(
        () => PreferencesRepositoryImpl(
              preferencesService: get(),
            ));

    // theme
    registerLazySingleton<ThemeRepository>(() => ThemeRepositoryImpl(
          preferencesRepo: get(),
        ));

    registerLazySingleton<OpenWeatherRepository>(
      () => OpenWeatherRepositoryImpl(
        openWeatherRemoteService: get(),
        domainOpenWeatherMapper: get(),
      ),
    );

    registerLazySingleton<DomainOpenWeatherMapper>(
      () => DomainOpenWeatherMapperImpl(),
    );

    registerLazySingleton<OpenWeatherPollutionRepository>(
      () => OpenWeatherPollutionRepositoryImpl(
        openWeatherPollutionRemoteService: get(),
        domainOpenWeatherPollutionMapper: get(),
      ),
    );

    registerLazySingleton<DomainOpenWeatherPollutionMapper>(
      () => DomainOpenWeatherPollutionMapperImpl(),
    );

    registerLazySingleton<OpenWeatherForecastRepository>(
      () => OpenWeatherForecastRepositoryImpl(
        openWeatherForecastRemoteService: get(),
        domainOpenWeatherForecastMapper: get(),
      ),
    );

    registerLazySingleton<DomainOpenWeatherForecastMapper>(
      () => DomainOpenWeatherForecastMapperImpl(),
    );
  }
}
