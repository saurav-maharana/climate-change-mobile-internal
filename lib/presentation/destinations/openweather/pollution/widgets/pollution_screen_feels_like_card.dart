import 'package:flutter/material.dart';
import 'package:flutter_template/domain/entity/openweather/pollution_info.dart';

class PollutionScreenFeelsLike extends StatelessWidget {
  final OpenWeatherPollutionInfo openWeatherPollutionInfo;

  const PollutionScreenFeelsLike({
    Key? key,
    required this.openWeatherPollutionInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.only(
        left: 10.0,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: openWeatherPollutionInfo.airQualityIndex.toString(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 50,
                      ),
                    ),
                    const TextSpan(
                      text: "\nFeels Like",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(),
          const SizedBox(
            height: 5.0,
          ),
          // pass componenets here
        ],
      ),
    );
  }
}
