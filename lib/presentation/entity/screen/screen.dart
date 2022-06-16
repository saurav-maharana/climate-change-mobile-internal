import 'package:flutter_template/presentation/entity/routes/routes.dart';

abstract class Screen {
  const Screen._();

  String get path;
}

class SearchScreen extends Screen {
  const SearchScreen() : super._();

  @override
  String get path => Routes.search;
}

class HomeScreen extends Screen {
  const HomeScreen() : super._();

  @override
  String get path => Routes.home;
}

class OpenWeatherHomeScreen extends Screen {
  const OpenWeatherHomeScreen() : super._();

  @override
  String get path => Routes.home;
}

class OpenWeatherPollutionScreen extends Screen {
  const OpenWeatherPollutionScreen() : super._();

  @override
  String get path => Routes.home;
}

class OpenWeatherForecastScreen extends Screen {
  const OpenWeatherForecastScreen() : super._();

  @override
  String get path => Routes.home;
}
