import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/base/page/base_page.dart';
import 'package:flutter_template/presentation/destinations/openweather/home/home_screen_state.dart';
import 'package:flutter_template/presentation/destinations/openweather/home/main_home_view_model.dart';
import 'package:flutter_template/presentation/entity/screen/screen.dart';

class OWHome extends StatelessWidget {
  const OWHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage<OpenWeatherHomeScreen, OpenWeatherHomeScreenState,
        OpenWeatherViewModel>(
      viewModelProvider: openWeatherHomeViewModel,
      body: Text("Something"),
    );
  }
}
