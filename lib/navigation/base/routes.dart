import 'package:auto_route/annotations.dart';
import 'package:flutter_template/presentation/destinations/openweather/main_home.dart';
import 'package:flutter_template/presentation/destinations/weather/home/home_page.dart';
import 'package:flutter_template/presentation/destinations/weather/search/search_page.dart';
import 'package:flutter_template/presentation/entity/routes/routes.dart';

const autoRoutes = [
  AutoRoute(
    path: Routes.home,
    page: HomePage,
  ),
  AutoRoute(
    path: Routes.search,
    page: SearchPage,
  ),
  AutoRoute(
    path: Routes.home,
    page: OpenWeatherSearchPageBody,
    initial: true,
  ),
];
