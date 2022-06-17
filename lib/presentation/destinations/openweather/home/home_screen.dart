// ignore_for_file: use_build_context_synchronously, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/presentation/destinations/openweather/forecast/forecast_screen.dart';
import 'package:flutter_template/presentation/destinations/openweather/home/home_screen_intent.dart';
import 'package:flutter_template/presentation/destinations/openweather/home/main_home_view_model.dart';
import 'package:flutter_template/presentation/destinations/openweather/pollution/pollution_screen.dart';
import 'package:hexcolor/hexcolor.dart';

class OpenWeatherHome extends ConsumerWidget {
  OpenWeatherHome({Key? key}) : super(key: key);

  List<bool> isSelectedList = [true, false];
  List<bool> isSelectedListLanguage = [true, false];
  final TextEditingController _controller = TextEditingController();
  String? cityName;

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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(openWeatherHomeViewModel.notifier);
    final newVM = ref.watch(openWeatherHomeViewModel);
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor('#E5E5E5'),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
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
                                      color: Colors.black, fontSize: 25),
                                ),
                                TextSpan(
                                  text: "Counts",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
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
                              try {
                                viewModel.onIntent(OpenWeatherHomeIntent.search(
                                    searchTerm: _controller.text));
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("$e"),
                                  ),
                                );
                              }
                            },
                            icon: const Icon(Icons.search),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Search City Here",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7.0),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: ToggleButtons(
                            selectedColor: Colors.black,
                            fillColor: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            onPressed: (int index) {
                              for (int i = 0;
                                  i < isSelectedListLanguage.length;
                                  i++) {
                                if (i == index) {
                                  isSelectedListLanguage[i] = true;
                                } else {
                                  isSelectedListLanguage[i] = false;
                                }
                              }
                            },
                            isSelected: isSelectedListLanguage,
                            children: const [
                              Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text("English"),
                              ),
                              Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text("Hindi"),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: ToggleButtons(
                            selectedColor: Colors.black,
                            fillColor: Colors.white,
                            borderRadius: BorderRadius.circular(30.0),
                            onPressed: (int index) {
                              for (int i = 0; i < isSelectedList.length; i++) {
                                if (i == index) {
                                  isSelectedList[i] = !isSelectedList[i];
                                } else {
                                  isSelectedList[i] = false;
                                }
                              }
                            },
                            isSelected: const [true, false],
                            children: const [
                              Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text("C"),
                              ),
                              Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text("F"),
                              ),
                            ],
                          ),
                        ),
                      ],
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
                          child: Text(
                            "${newVM.currentWeather.cityName} as on ${DateTime.now().hour}:${DateTime.now().minute} ${DateTime.now().timeZoneName}",
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
                        color: HexColor('#91B8DE'),
                        elevation: 0.0,
                        child: Text.rich(TextSpan(
                          children: [
                            TextSpan(
                              text: newVM.currentWeather.currentTemperature
                                  .roundToDouble()
                                  .toString()
                                  .padLeft(7),
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
                            TextSpan(
                              text: newVM.currentWeather.description,
                              style: const TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )),
                      ),
                      const Divider(),
                      (newVM.currentWeather.description.contains('clouds') ||
                              newVM.currentWeather.description.contains('haze'))
                          ? ClipRRect(
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(13.0),
                              ),
                              child: Image.asset('assets/images/cloudy.png'))
                          : newVM.currentWeather.description
                                  .contains('Clear Sky')
                              ? ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(13.0),
                                  ),
                                  child: Image.asset('assets/images/sunny.png'))
                              : (newVM.currentWeather.description
                                          .contains('Rainy') ||
                                      newVM.currentWeather.description
                                          .contains('drizzle'))
                                  ? ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(13.0),
                                      ),
                                      child: Image.asset(
                                          'assets/images/raining.png'))
                                  : ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(13.0),
                                      ),
                                      child: Image.asset(
                                          'assets/images/city.png')),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
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
                                fontSize: 15,
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
                                  text: newVM.currentWeather.feelsLike
                                      .roundToDouble()
                                      .toString(),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 50,
                                  ),
                                ),
                                const TextSpan(
                                  text: "\u00b0C\n",
                                  style: TextStyle(
                                    fontSize: 50,
                                    color: Colors.black,
                                  ),
                                ),
                                const TextSpan(
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
                              children: [
                                const Text("High/Low"),
                                Text(
                                    "${newVM.currentWeather.maximumTemperature}/${newVM.currentWeather.minimumTemperature}"),
                              ],
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Humidity"),
                                Text(newVM.currentWeather.humidity.toString()),
                              ],
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Pressure"),
                                Text(newVM.currentWeather.presssure.toString()),
                              ],
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Visibility"),
                                Text(
                                    newVM.currentWeather.visibility.toString()),
                              ],
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Wind"),
                                Text("${newVM.currentWeather.windSpeed}mph"),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
