import 'package:flutter/material.dart';
import 'package:flutter_template/domain/entity/openweather/weather_forecast.dart';
import 'package:flutter_template/presentation/destinations/openweather/forecast/date_forecast.dart';
import 'package:flutter_template/presentation/destinations/openweather/forecast/widget/forecast_scroll_structure.dart';
import 'package:flutter_template/presentation/destinations/openweather/home/main_home_view_model_impl.dart';
import 'package:intl/intl.dart';

class ForecastDetails extends StatelessWidget {
  final OpenWeatherForecast openWeatherForecast;

  const ForecastDetails({
    Key? key,
    required this.openWeatherForecast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 1.0,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.only(
              left: 20.0,
            ),
            child: Row(
              children: [
                language == "en"
                    ? const Text(
                        "Daily Forecast",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 27,
                        ),
                      )
                    : const Text(
                        "की तरह लगना",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 27,
                        ),
                      ),
              ],
            ),
          ),
          const SizedBox(
            height: 35.0,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IntrinsicHeight(
                child: SizedBox(
                  height: 60.0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      children: [
                        ForecastScrollStrcutre(
                            dayOfWeek: dateNow ==
                                    DateFormat('EEEE').format(DateTime.now())
                                ? "Today"
                                : dateNow,
                            temperatureOnThatDay:
                                openWeatherForecast.weatherForecast.isEmpty
                                    ? "0"
                                    : openWeatherForecast.weatherForecast[0]
                                        .toString()),
                        const VerticalDivider(
                          thickness: 2,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          width: 15.0,
                        ),
                        ForecastScrollStrcutre(
                            dayOfWeek: dateNow1,
                            temperatureOnThatDay:
                                openWeatherForecast.weatherForecast.isEmpty
                                    ? "0"
                                    : openWeatherForecast.weatherForecast[1]
                                        .toString()),
                        const VerticalDivider(
                          thickness: 2,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          width: 15.0,
                        ),
                        ForecastScrollStrcutre(
                            dayOfWeek: dateNow2,
                            temperatureOnThatDay:
                                openWeatherForecast.weatherForecast.isEmpty
                                    ? "0"
                                    : openWeatherForecast.weatherForecast[2]
                                        .toString()),
                        const VerticalDivider(
                          thickness: 2,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          width: 15.0,
                        ),
                        ForecastScrollStrcutre(
                            dayOfWeek: dateNow3,
                            temperatureOnThatDay:
                                openWeatherForecast.weatherForecast.isEmpty
                                    ? "0"
                                    : openWeatherForecast.weatherForecast[3]
                                        .toString()),
                        const VerticalDivider(
                          thickness: 2,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          width: 15.0,
                        ),
                        ForecastScrollStrcutre(
                            dayOfWeek: dateNow4,
                            temperatureOnThatDay:
                                openWeatherForecast.weatherForecast.isEmpty
                                    ? "0"
                                    : openWeatherForecast.weatherForecast[4]
                                        .toString()),
                        const VerticalDivider(
                          thickness: 2,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          width: 14.0,
                        ),
                        ForecastScrollStrcutre(
                            dayOfWeek: dateNow5,
                            temperatureOnThatDay:
                                openWeatherForecast.weatherForecast.isEmpty
                                    ? "0"
                                    : openWeatherForecast.weatherForecast[5]
                                        .toString()),
                        const VerticalDivider(
                          thickness: 2,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          width: 15.0,
                        ),
                        ForecastScrollStrcutre(
                            dayOfWeek: dateNow6,
                            temperatureOnThatDay:
                                openWeatherForecast.weatherForecast.isEmpty
                                    ? "0"
                                    : openWeatherForecast.weatherForecast[6]
                                        .toString()),
                        const VerticalDivider(
                          thickness: 2,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          width: 15.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 100.0,
          ),
        ],
      ),
    );
  }
}
