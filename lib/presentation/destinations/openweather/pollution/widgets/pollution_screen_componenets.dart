import 'package:flutter/material.dart';
import 'package:flutter_template/domain/entity/openweather/pollution_info.dart';

class PollutionScreenComponents extends StatelessWidget {
  final OpenWeatherPollutionInfo openWeatherPollutionInfo;

  const PollutionScreenComponents({
    Key? key,
    required this.openWeatherPollutionInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 10.0,
        right: 10.0,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("CO"),
              Text(openWeatherPollutionInfo.co.toString()),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("NO"),
              Text(openWeatherPollutionInfo.no.toString()),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("NO2"),
              Text(openWeatherPollutionInfo.no2.toString()),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("O3"),
              Text(openWeatherPollutionInfo.o3.toString()),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("SO2"),
              Text(openWeatherPollutionInfo.so2.toString()),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("PM2_5"),
              Text(openWeatherPollutionInfo.pm2_5.toString()),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("NH3"),
              Text(openWeatherPollutionInfo.nh3.toString()),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("PM10"),
              Text(openWeatherPollutionInfo.pm10.toString()),
            ],
          ),
          const Divider(),
          Container(
            height: 100.0,
          ),
        ],
      ),
    );
  }
}
