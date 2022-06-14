// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/destinations/openweather/forecast/forecast.dart';
import 'package:flutter_template/presentation/destinations/openweather/home/home_screen.dart';
import 'package:hexcolor/hexcolor.dart';

class PollutionScreen extends StatefulWidget {
  const PollutionScreen({Key? key}) : super(key: key);

  @override
  State<PollutionScreen> createState() => _PollutionScreenState();
}

class _PollutionScreenState extends State<PollutionScreen> {
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
          MaterialPageRoute(builder: (context) => OpenWeatherHome()),
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
                padding: const EdgeInsets.all(8.0),
                color: Colors.white,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.0)),
                  color: HexColor('#EF4444'),
                  child: Column(
                    children: [
                      Container(
                        color: const Color.fromRGBO(0, 0, 0, 0.2),
                        width: double.infinity,
                        height: 40,
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
                        margin: const EdgeInsets.only(
                          left: 30.0,
                        ),
                        color: HexColor('#EF4444'),
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
                              text: "34".padLeft(6),
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
                      Image.asset('assets/images/city.png'),
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
                          children: const [
                            Text.rich(TextSpan(
                              children: [
                                TextSpan(
                                  text: "34",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 50,
                                  ),
                                ),
                                TextSpan(
                                  text: "\u00b0C\n",
                                  style: TextStyle(
                                    fontSize: 50,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: "Feels Like",
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
                              children: const [
                                Text("CO"),
                                Text("34"),
                              ],
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text("NO"),
                                Text(
                                  "34",
                                ),
                              ],
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text("NO2"),
                                Text("34"),
                              ],
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text("O3"),
                                Text("34"),
                              ],
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text("SO2"),
                                Text("34"),
                              ],
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text("PM2_5"),
                                Text(
                                  "34",
                                ),
                              ],
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text("NH3"),
                                Text(
                                  "34",
                                ),
                              ],
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text("PM10"),
                                Text(
                                  "34",
                                ),
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
