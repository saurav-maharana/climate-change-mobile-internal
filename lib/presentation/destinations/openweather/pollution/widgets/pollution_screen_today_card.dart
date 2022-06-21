import 'package:flutter/material.dart';
import 'package:flutter_template/domain/entity/openweather/pollution_info.dart';
import 'package:flutter_template/presentation/destinations/openweather/home/main_home_view_model_impl.dart';
import 'package:flutter_template/presentation/destinations/openweather/pollution/widgets/pollution_screen_componenets.dart';

class PollutionScreenTodayCard extends StatelessWidget {
  final OpenWeatherPollutionInfo openWeatherPollutionInfo;

  const PollutionScreenTodayCard({
    Key? key,
    required this.openWeatherPollutionInfo,
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
            margin: const EdgeInsets.only(
              top: 10.0,
              left: 10.0,
            ),
            child: Row(
              children: [
                language == "en"
                    ? const Text(
                        "Weather Today",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      )
                    : const Text(
                        "अभी अपडेट किया गया",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
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
                      text: openWeatherPollutionInfo.airQualityIndex.toString(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 50,
                      ),
                    ),
                    TextSpan(
                      text: language == "en" ? "\nFeels Like" : "\nकी तरह लगना",
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                      ),
                    ),
                  ],
                )),
              ],
            ),
          ),
          PollutionScreenComponents(
              openWeatherPollutionInfo: openWeatherPollutionInfo),
        ],
      ),
    );
  }
}
