import 'package:flutter/material.dart';
import 'package:flutter_template/domain/entity/openweather/weather_forecast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_template/presentation/destinations/openweather/home/main_home_view_model_impl.dart';

class ForecastCurrentTemperatureCard extends StatelessWidget {
  final OpenWeatherForecast openWeatherForecast;

  const ForecastCurrentTemperatureCard({
    Key? key,
    required this.openWeatherForecast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
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
                  "$globalCityName as on ${DateTime.now().hour}:${DateTime.now().minute} ${DateTime.now().timeZoneName}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            const Divider(),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13.0)),
              margin: const EdgeInsets.only(
                left: 30.0,
              ),
              color: HexColor('#91B8DE'),
              elevation: 0.0,
              child: Text.rich(TextSpan(
                children: [
                  const TextSpan(
                    text: "Current Temperature\n",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  TextSpan(
                    text: openWeatherForecast.weatherForecast.isNotEmpty
                        ? openWeatherForecast.weatherForecast[0]
                            .toString()
                            .padLeft(9)
                        : "0".padLeft(8),
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
                ],
              )),
            ),
            const Divider(),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(13.0),
                  bottomRight: Radius.circular(13.0)),
              child: Image.asset('assets/images/city.png'),
            ),
          ],
        ),
      ),
    );
  }
}
