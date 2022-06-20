import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/destinations/openweather/forecast/forecast_screen.dart';
import 'package:flutter_template/presentation/destinations/openweather/pollution/pollution_screen.dart';

class OpenWeatherCommonHeader extends StatelessWidget {
  const OpenWeatherCommonHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> showOptionsMenu(BuildContext context, int hiveIndex) async {
      int? selected = await showMenu(
        position: const RelativeRect.fromLTRB(100, 00, 30, 30),
        context: context,
        items: const [
          PopupMenuItem(
            value: 0,
            child: Text("Home"),
          ),
          PopupMenuItem(
            value: 1,
            child: Text("Pollution Info"),
          ),
          PopupMenuItem(
            value: 2,
            child: Text("Forecast"),
          ),
        ],
      );
      if (selected == 0) {
        null;
      } else if (selected == 1) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => PollutionScreen()),
            (route) => false);
      } else if (selected == 2) {
        Navigator.of(context).pushAndRemoveUntil(
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
