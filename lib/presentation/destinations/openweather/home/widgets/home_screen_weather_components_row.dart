import 'package:flutter/material.dart';
import 'package:flutter_template/domain/entity/openweather/current_weather.dart';
import 'package:flutter_template/presentation/destinations/openweather/home/main_home_view_model_impl.dart';

class HomeScreenWeatherComponents extends StatelessWidget {
  final CurrentWeather currentWeather;

  const HomeScreenWeatherComponents({
    Key? key,
    required this.currentWeather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            language == "en" ? const Text("High/Low") : const Text("उच्च/कम"),
            Text(
                "${currentWeather.maximumTemperature} / ${currentWeather.minimumTemperature}"),
          ],
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            language == "en" ? const Text("Humidity") : const Text("नमी"),
            Text(currentWeather.humidity.toString()),
          ],
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            language == "en" ? const Text("Pressure") : const Text("दबाव"),
            Text(currentWeather.presssure.toString()),
          ],
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            language == "en" ? const Text("Visibility") : const Text("दृश्यता"),
            Text(currentWeather.visibility.toString()),
          ],
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            language == "en" ? const Text("Wind") : const Text("हवा"),
            Text("${currentWeather.windSpeed}mph"),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
