import 'package:flutter/material.dart';
import 'package:flutter_template/domain/entity/openweather/current_weather.dart';
import 'package:flutter_template/presentation/destinations/openweather/home/widgets/home_screen_weather_components_row.dart';

class HomeScreenFeelsLikeCard extends StatelessWidget {
  final CurrentWeather currentWeather;

  const HomeScreenFeelsLikeCard({
    Key? key,
    required this.currentWeather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 1.0,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 10.0,
                left: 10.0,
              ),
              child: Row(
                children: const [
                  Text(
                    "Weather Today",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.only(
                left: 10.0,
              ),
              child: Row(
                children: [
                  Text.rich(TextSpan(
                    children: [
                      TextSpan(
                        text:
                            currentWeather.feelsLike.roundToDouble().toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 50,
                        ),
                      ),
                      const TextSpan(
                        text: "\u00b0C\n",
                        style: TextStyle(
                          fontSize: 50,
                          color: Colors.black,
                        ),
                      ),
                      const TextSpan(
                        text: "Feels Like",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  )),
                ],
              ),
            ),
            const Divider(),
            const SizedBox(
              height: 5.0,
            ),
            Container(
              margin: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Column(
                children: [
                  HomeScreenWeatherComponents(currentWeather: currentWeather),
                ],
              ),
            ),
            const SizedBox(
              height: 100.0,
            ),
          ],
        ),
      ),
    );
  }
}
