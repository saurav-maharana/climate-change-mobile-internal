import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/destinations/openweather/forecast/forecast_screen.dart';
import 'package:flutter_template/presentation/destinations/openweather/home/home_screen.dart';
import 'package:flutter_template/presentation/destinations/openweather/home/main_home_view_model_impl.dart';
import 'package:flutter_template/presentation/destinations/openweather/pollution/pollution_screen.dart';

class OpenWeatherCommonHeader extends StatelessWidget {
  const OpenWeatherCommonHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);
    Future<void> showOptionsMenu(BuildContext context, int hiveIndex) async {
      int? selected = await showMenu(
        position: const RelativeRect.fromLTRB(100, 00, 30, 30),
        context: context,
        items: [
          PopupMenuItem(
            value: 0,
            child: language == "en" ? const Text("Home") : const Text("होम"),
          ),
          PopupMenuItem(
            value: 1,
            child: language == "en"
                ? const Text("Pollution Info")
                : const Text("प्रदूषण की जानकारी"),
          ),
          PopupMenuItem(
            value: 2,
            child: language == "en"
                ? const Text("Forecast")
                : const Text("भविष्यवाणी"),
          ),
        ],
      );

      if (selected == 0) {
        navigator.pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const OpenWeatherHome()),
            (route) => false);
      } else if (selected == 1) {
        navigator.pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => PollutionScreen()),
            (route) => false);
      } else if (selected == 2) {
        navigator.pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => WeatherForecast()),
            (route) => false);
      } else {
        null;
      }
    }

    return Container(
      margin: const EdgeInsets.only(top: 25.0, left: 10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/cloud.png',
                height: 50,
                width: 65,
              ),
              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Climate",
                      style: TextStyle(color: Colors.black, fontSize: 25),
                    ),
                    TextSpan(
                      text: "Counts",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => showOptionsMenu(context, 0),
                child: Container(
                  margin: const EdgeInsets.only(right: 20.0),
                  child: const ImageIcon(
                    AssetImage('assets/images/menu.png'),
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
