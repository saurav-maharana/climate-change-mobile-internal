import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/presentation/destinations/openweather/common/openweather_header.dart';
import 'package:flutter_template/presentation/destinations/openweather/forecast/forecast_screen_intent.dart';
import 'package:flutter_template/presentation/destinations/openweather/forecast/forecast_screen_viewmodel.dart';
import 'package:flutter_template/presentation/destinations/openweather/forecast/widget/forecast_current_temperature_card.dart';
import 'package:flutter_template/presentation/destinations/openweather/forecast/widget/forecast_details_card.dart';
import 'package:flutter_template/presentation/destinations/openweather/home/main_home_view_model_impl.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/date_symbol_data_local.dart';

class WeatherForecast extends ConsumerWidget {
  WeatherForecast({Key? key}) : super(key: key);

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forecastScreenViewModel =
        ref.watch(openWeatherForecastViewModel.notifier);

    final forecastScreenViewModelNew = ref.watch(openWeatherForecastViewModel);

    initializeDateFormatting();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 170.0,
                color: HexColor('#91B8DE'),
                child: Column(
                  children: [
                    const OpenWeatherCommonHeader(),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () async {
                              globalCityName = _controller.text;
                              forecastScreenViewModel.onIntent(
                                OpenWeatherForecastIntent.search(
                                    cityName: globalCityName),
                              );
                            },
                            icon: const Icon(Icons.search),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Search City Here",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ForecastCurrentTemperatureCard(
                  openWeatherForecast:
                      forecastScreenViewModelNew.openWeatherForecast),
              const SizedBox(
                height: 20.0,
              ),
              ForecastDetails(
                  openWeatherForecast:
                      forecastScreenViewModelNew.openWeatherForecast),
            ],
          ),
        ),
      ),
    );
  }
}
