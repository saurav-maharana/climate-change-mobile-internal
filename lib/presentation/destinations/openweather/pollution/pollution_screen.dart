// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/presentation/destinations/openweather/forecast/forecast_screen.dart';
import 'package:flutter_template/presentation/destinations/openweather/home/home_screen.dart';
import 'package:flutter_template/presentation/destinations/openweather/home/main_home_view_model_impl.dart';
import 'package:flutter_template/presentation/destinations/openweather/pollution/pollution_screen_intent.dart';
import 'package:flutter_template/presentation/destinations/openweather/pollution/pollution_screen_viewmodel.dart';
import 'package:hexcolor/hexcolor.dart';

class PollutionScreen extends ConsumerWidget {
  PollutionScreen({Key? key}) : super(key: key);

  final TextEditingController _controller = TextEditingController();

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
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => OpenWeatherHome()),
          (route) => false);
    } else if (selected == 1) {
      null;
    } else if (selected == 2) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => WeatherForecast()),
          (route) => false);
    } else {
      null;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pollutionScreenViewModelUse =
        ref.watch(pollutionScreenViewModel.notifier);
    final newPollutionScreenViewModel = ref.watch(pollutionScreenViewModel);
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor('#E5E5E5'),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 160.0,
                color: HexColor('#91B8DE'),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 25.0, left: 10.0),
                      child: Row(
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
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                  ),
                                ),
                                TextSpan(
                                  text: "Counts",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                  ),
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
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () async {
                              globalCityName = _controller.text;
                              pollutionScreenViewModelUse.onIntent(
                                  PollutionScreenIntent.searchUsingCityName(
                                      cityName: globalCityName));
                            },
                            icon: const Icon(Icons.search),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Search City Here",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.0)),
                  color: newPollutionScreenViewModel
                              .openWeatherPollutionInfo.airQualityIndex ==
                          1
                      ? HexColor('#22C55E')
                      : (newPollutionScreenViewModel.openWeatherPollutionInfo
                                      .airQualityIndex >=
                                  2 &&
                              newPollutionScreenViewModel
                                      .openWeatherPollutionInfo
                                      .airQualityIndex <=
                                  3)
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
                          child: _controller.text.isNotEmpty
                              ? Text(
                                  "${_controller.text} as on ${DateTime.now().hour}:${DateTime.now().minute} ${DateTime.now().timeZoneName}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                  ),
                                )
                              : Text(
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
                        color: newPollutionScreenViewModel
                                    .openWeatherPollutionInfo.airQualityIndex ==
                                1
                            ? HexColor('#22C55E')
                            : (newPollutionScreenViewModel
                                            .openWeatherPollutionInfo
                                            .airQualityIndex >=
                                        2 &&
                                    newPollutionScreenViewModel
                                            .openWeatherPollutionInfo
                                            .airQualityIndex <=
                                        3)
                                ? HexColor('#EAB308')
                                : HexColor('#EF4444'),
                        elevation: 0.0,
                        child: Text.rich(TextSpan(
                          children: [
                            const TextSpan(
                              text: "Air Quality Index\n",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                              ),
                            ),
                            TextSpan(
                              text:
                                  "${newPollutionScreenViewModel.openWeatherPollutionInfo.airQualityIndex}"
                                      .padLeft(8),
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
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              Padding(
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
                                  text: newPollutionScreenViewModel
                                      .openWeatherPollutionInfo.airQualityIndex
                                      .toString(),
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
                            )),
                          ],
                        ),
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Container(
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
                                Text(newPollutionScreenViewModel
                                    .openWeatherPollutionInfo.co
                                    .toString()),
                              ],
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("NO"),
                                Text(newPollutionScreenViewModel
                                    .openWeatherPollutionInfo.no
                                    .toString()),
                              ],
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("NO2"),
                                Text(newPollutionScreenViewModel
                                    .openWeatherPollutionInfo.no2
                                    .toString()),
                              ],
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("O3"),
                                Text(newPollutionScreenViewModel
                                    .openWeatherPollutionInfo.o3
                                    .toString()),
                              ],
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("SO2"),
                                Text(newPollutionScreenViewModel
                                    .openWeatherPollutionInfo.so2
                                    .toString()),
                              ],
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("PM2_5"),
                                Text(newPollutionScreenViewModel
                                    .openWeatherPollutionInfo.pm2_5
                                    .toString()),
                              ],
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("NH3"),
                                Text(newPollutionScreenViewModel
                                    .openWeatherPollutionInfo.nh3
                                    .toString()),
                              ],
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("PM10"),
                                Text(newPollutionScreenViewModel
                                    .openWeatherPollutionInfo.pm10
                                    .toString()),
                              ],
                            ),
                            const Divider(),
                            Container(
                              height: 100.0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
