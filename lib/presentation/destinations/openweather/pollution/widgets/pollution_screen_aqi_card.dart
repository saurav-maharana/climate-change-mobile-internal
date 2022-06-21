import 'package:flutter/material.dart';
import 'package:flutter_template/domain/entity/openweather/pollution_info.dart';
import 'package:flutter_template/presentation/destinations/openweather/home/main_home_view_model_impl.dart';
import 'package:hexcolor/hexcolor.dart';

class PollutionScreenAQICard extends StatelessWidget {
  final OpenWeatherPollutionInfo openWeatherPollutionInfo;

  const PollutionScreenAQICard({
    Key? key,
    required this.openWeatherPollutionInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.0)),
      color: openWeatherPollutionInfo.airQualityIndex == 1
          ? HexColor('#22C55E')
          : (openWeatherPollutionInfo.airQualityIndex >= 2 &&
                  openWeatherPollutionInfo.airQualityIndex <= 3)
              ? HexColor('#EAB308')
              : HexColor('#EF4444'),
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
            height: 40,
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
            margin: const EdgeInsets.only(
              left: 30.0,
            ),
            color: openWeatherPollutionInfo.airQualityIndex == 1
                ? HexColor('#22C55E')
                : (openWeatherPollutionInfo.airQualityIndex >= 2 &&
                        openWeatherPollutionInfo.airQualityIndex <= 3)
                    ? HexColor('#EAB308')
                    : HexColor('#EF4444'),
            elevation: 0.0,
            child: Text.rich(TextSpan(
              children: [
                TextSpan(
                  text: language == "en"
                      ? "Air Quality Index\n"
                      : "वायु गुणवत्ता सूचकांक स्तर",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                TextSpan(
                  text:
                      "${openWeatherPollutionInfo.airQualityIndex}".padLeft(8),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 50,
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
              child: Image.asset('assets/images/city.png')),
        ],
      ),
    );
  }
}
