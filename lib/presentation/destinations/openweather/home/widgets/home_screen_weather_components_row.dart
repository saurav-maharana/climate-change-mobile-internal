import 'package:flutter/material.dart';
import 'package:flutter_template/domain/entity/openweather/current_weather.dart';

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
            const Text("High/Low"),
            Text(
                "${currentWeather.maximumTemperature} / ${currentWeather.minimumTemperature}"),
          ],
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Humidity"),
            Text(currentWeather.humidity.toString()),
          ],
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Pressure"),
            Text(currentWeather.presssure.toString()),
          ],
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Visibility"),
            Text(currentWeather.visibility.toString()),
          ],
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Wind"),
            Text("${currentWeather.windSpeed}mph"),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
