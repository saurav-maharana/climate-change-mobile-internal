import 'package:flutter/material.dart';
import 'package:flutter_template/domain/entity/openweather/current_weather.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreenCard extends StatelessWidget {
  final CurrentWeather currentWeather;

  const HomeScreenCard({
    Key? key,
    required this.currentWeather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.0)),
        color: HexColor('#91B8DE'),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(13.0),
                  topRight: Radius.circular(13.0),
                ),
                color: Color.fromRGBO(0, 0, 0, 0.2),
              ),
              width: double.infinity,
              height: 30.0,
              child: Center(
                child: Text(
                  "${currentWeather.cityName} as on ${DateTime.now().hour}:${DateTime.now().minute} ${DateTime.now().timeZoneName}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            const Divider(),
            Card(
              margin: const EdgeInsets.only(
                left: 30.0,
              ),
              color: HexColor('#91B8DE'),
              elevation: 0.0,
              child: Text.rich(TextSpan(
                children: [
                  TextSpan(
                    text: currentWeather.currentTemperature
                        .roundToDouble()
                        .toString()
                        .padLeft(7),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                    ),
                  ),
                  const TextSpan(
                    text: "\u00b0C\n",
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text: currentWeather.description,
                    style: const TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ],
              )),
            ),
            const Divider(),
            (currentWeather.description.contains('clouds') ||
                    currentWeather.description.contains('haze'))
                ? ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(13.0),
                    ),
                    child: Image.asset('assets/images/cloudy.png'))
                : currentWeather.description.contains('Clear Sky')
                    ? ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(13.0),
                        ),
                        child: Image.asset('assets/images/sunny.png'))
                    : (currentWeather.description.contains('Rainy') ||
                            currentWeather.description.contains('drizzle'))
                        ? ClipRRect(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(13.0),
                            ),
                            child: Image.asset('assets/images/raining.png'))
                        : ClipRRect(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(13.0),
                            ),
                            child: Image.asset('assets/images/city.png')),
          ],
        ),
      ),
    );
  }
}
