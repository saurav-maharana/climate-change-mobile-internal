// ignore_for_file: use_build_context_synchronously, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/presentation/destinations/openweather/forecast/forecast_screen_intent.dart';
import 'package:flutter_template/presentation/destinations/openweather/forecast/forecast_screen_viewmodel.dart';
import 'package:flutter_template/presentation/destinations/openweather/home/home_screen.dart';
import 'package:flutter_template/presentation/destinations/openweather/home/main_home_view_model_impl.dart';
import 'package:flutter_template/presentation/destinations/openweather/pollution/pollution_screen.dart';
import 'package:hexcolor/hexcolor.dart';

class WeatherForecast extends ConsumerWidget {
  String cityName;

  WeatherForecast({
    Key? key,
    this.cityName = "",
  }) : super(key: key);

  double latitude = 0.0;
  double longitude = 0.0;

  // final dateNow = DateFormat('EEEE').format(DateTime.now());
  // final dateNow1 = DateFormat('EEEE')
  //     .format(DateTime.now().add(const Duration(days: 1)))
  //     .substring(0, 3);
  // final dateNow2 = DateFormat('EEEE')
  //     .format(DateTime.now().add(const Duration(days: 2)))
  //     .substring(0, 3);
  // final dateNow3 = DateFormat('EEEE')
  //     .format(DateTime.now().add(const Duration(days: 3)))
  //     .substring(0, 3);
  // final dateNow4 = DateFormat('EEEE')
  //     .format(DateTime.now().add(const Duration(days: 4)))
  //     .substring(0, 3);
  // final dateNow5 = DateFormat('EEEE')
  //     .format(DateTime.now().add(const Duration(days: 5)))
  //     .substring(0, 3);
  // final dateNow6 = DateFormat('EEEE')
  //     .format(DateTime.now().add(const Duration(days: 6)))
  //     .substring(0, 3);
  // final dateNow7 = DateFormat('EEEE')
  //     .format(DateTime.now().add(const Duration(days: 7)))
  //     .substring(0, 3);

  final TextEditingController _controller = TextEditingController();

  Future<void> showOptionsMenu(BuildContext context, int hiveIndex) async {
    int? selected = await showMenu(
      position: const RelativeRect.fromLTRB(100, 00, 30, 30),
      context: context,
      items: [
        const PopupMenuItem(
          value: 0,
          child: Text("Home"),
        ),
        const PopupMenuItem(
          value: 1,
          child: Text("Pollution Info"),
        ),
        const PopupMenuItem(
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
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => PollutionScreen()),
          (route) => false);
    } else {
      null;
    }
  }

  // getForecast() async {
  //   try {
  //     await GeocodingPlatform.instance
  //         .locationFromAddress(widget.cityName)
  //         .then((value) async {
  //       setState(() {
  //         latitude = value[0].latitude;
  //         longitude = value[0].longitude;
  //       });
  //     });
  //     final res = await FutureForecast()
  //         .getForecast(latitude.toString(), longitude.toString(), widget.units);
  //     setState(() {
  //       weatherForecast = res;
  //     });
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       content: Text(
  //         e.toString(),
  //         style: const TextStyle(color: Colors.black),
  //       ),
  //       backgroundColor: Theme.of(context).backgroundColor,
  //     ));
  //     setState(() {
  //       weatherForecast = WeatherForecast(weatherForecast: []);
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forecastScreenViewModel =
        ref.watch(openWeatherForecastViewModel.notifier);

    final forecastScreenViewModelNew = ref.watch(openWeatherForecastViewModel);
    return SafeArea(
      child: Scaffold(
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
                              forecastScreenViewModel.onIntent(
                                  OpenWeatherForecastIntent.search(
                                      latitude: '', longitude: ''));
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
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.0)),
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
                              text: forecastScreenViewModelNew
                                      .openWeatherForecast
                                      .weatherForecast
                                      .isNotEmpty
                                  ? forecastScreenViewModelNew
                                      .openWeatherForecast.weatherForecast[0]
                                      .toString()
                                  : "0",
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
              ),
              const SizedBox(
                height: 20.0,
              ),
              Card(
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
                        children: const [
                          Text(
                            "Daily Forecast",
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
                                  Column(
                                    children: const [
                                      Text(
                                        "Today",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                      SizedBox(height: 20.0),
                                      Text(
                                        "0",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const VerticalDivider(
                                    thickness: 2,
                                    color: Colors.black,
                                  ),
                                  const SizedBox(
                                    width: 15.0,
                                  ),
                                  Column(
                                    children: const [
                                      Text(
                                        "today + 1",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                      SizedBox(height: 20.0),
                                      Text(
                                        "0",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const VerticalDivider(
                                    thickness: 2,
                                    color: Colors.black,
                                  ),
                                  const SizedBox(
                                    width: 15.0,
                                  ),
                                  Column(
                                    children: const [
                                      Text(
                                        "today + 2",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                      SizedBox(height: 18.0),
                                      Text(
                                        "0",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const VerticalDivider(
                                    thickness: 2,
                                    color: Colors.black,
                                  ),
                                  const SizedBox(
                                    width: 15.0,
                                  ),
                                  Column(
                                    children: const [
                                      Text(
                                        "Today + 3",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                      SizedBox(height: 16.0),
                                      Text(
                                        "0",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const VerticalDivider(
                                    thickness: 2,
                                    color: Colors.black,
                                  ),
                                  const SizedBox(
                                    width: 15.0,
                                  ),
                                  Column(
                                    children: const [
                                      Text(
                                        "Today + 4",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                      SizedBox(height: 16.0),
                                      Text(
                                        "0",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const VerticalDivider(
                                    thickness: 2,
                                    color: Colors.black,
                                  ),
                                  const SizedBox(
                                    width: 14.0,
                                  ),
                                  Column(
                                    children: const [
                                      Text(
                                        "Today + 5",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                      SizedBox(height: 15.0),
                                      Text(
                                        "0",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const VerticalDivider(
                                    thickness: 2,
                                    color: Colors.black,
                                  ),
                                  const SizedBox(
                                    width: 15.0,
                                  ),
                                  Column(
                                    children: const [
                                      Text(
                                        "Today + 6",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                      SizedBox(height: 15.0),
                                      Text(
                                        "0",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
