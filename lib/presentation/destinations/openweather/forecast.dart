// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/destinations/openweather/main_home.dart';
import 'package:flutter_template/presentation/destinations/openweather/pollution_info.dart';
import 'package:hexcolor/hexcolor.dart';

class WeatherForecast extends StatefulWidget {
  const WeatherForecast({Key? key}) : super(key: key);

  @override
  State<WeatherForecast> createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  final TextEditingController _controller = TextEditingController();

  Future<void> showOptionsMenu(int hiveIndex) async {
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
          child: Text("Forecast"),
        ),
      ],
    );
    if (selected == 0) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const OpenWeatherHome()),
          (route) => false);
    } else if (selected == 1) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const PollutionScreen()),
          (route) => false);
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const WeatherForecast()),
          (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
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
                            onTap: () => showOptionsMenu(0),
                            child: Container(
                              margin: const EdgeInsets.only(right: 20.0),
                              child: const Icon(
                                Icons.menu,
                                color: Colors.black,
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
                            onPressed: () async {},
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
                // color: Colors.white,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.0)),
                  color: HexColor('#91B8DE'),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 30.0,
                        child: Center(
                          child: Text(
                            "${_controller.text} as on ${DateTime.now().hour}:${DateTime.now().minute} ${DateTime.now().timeZoneName}",
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
                        child: const Text.rich(TextSpan(
                          children: [
                            TextSpan(
                              text: "Current Temperature\n",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                              ),
                            ),
                            TextSpan(
                              text: "45",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                              ),
                            ),
                            TextSpan(
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
                          Text("Forecast"),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 35.0,
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 30.0,
                        right: 10.0,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text(DateTime.now().day.toString()),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  const Text("56"),
                                ],
                              ),
                              const SizedBox(
                                width: 15.0,
                              ),
                              Column(
                                children: [
                                  Text(DateTime.now().day.toString()),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  const Text("65"),
                                ],
                              ),
                              const SizedBox(
                                width: 15.0,
                              ),
                              Column(
                                children: [
                                  Text(DateTime.now().day.toString()),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  const Text("67"),
                                ],
                              ),
                              const SizedBox(
                                width: 15.0,
                              ),
                              Column(
                                children: [
                                  Text(DateTime.now().day.toString()),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  const Text("76"),
                                ],
                              ),
                              const SizedBox(
                                width: 15.0,
                              ),
                            ],
                          ),
                          const Divider(),
                          Row(
                            children: [
                              Container(
                                height: 100.0,
                              ),
                            ],
                          ),
                        ],
                      ),
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
