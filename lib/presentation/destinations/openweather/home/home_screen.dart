// ignore_for_file: use_build_context_synchronously, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/presentation/destinations/openweather/forecast/forecast.dart';
import 'package:flutter_template/presentation/destinations/openweather/home/home_screen_intent.dart';
import 'package:flutter_template/presentation/destinations/openweather/home/main_home_view_model.dart';
import 'package:flutter_template/presentation/destinations/openweather/pollution/pollution_info.dart';
import 'package:hexcolor/hexcolor.dart';

class OpenWeatherHome extends ConsumerWidget {
  OpenWeatherHome({Key? key}) : super(key: key);

  late List<bool> isSelectedList;
  late List<bool> isSelectedListLanguage;
  final TextEditingController _controller = TextEditingController();
  String? cityName;

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
    } else if (selected == 3) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const WeatherForecast()),
          (route) => false);
    } else {}
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                            onTap: () {
                              final viewModel =
                                  ref.watch(openWeatherHomeViewModel.notifier);
                              viewModel.onIntent(
                                OpenWeatherHomeIntent.search(
                                    searchTerm: 'Pune'),
                              );
                              // showOptionsMenu(0);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 20.0),
                              child: const Icon(
                                Icons.menu,
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
                              try {} catch (e) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: const Text(
                                    "City Not Found",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  backgroundColor:
                                      Theme.of(context).backgroundColor,
                                ));
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
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Padding(
                    //       padding: const EdgeInsets.all(15.0),
                    //       child: ToggleButtons(
                    //         selectedColor: Colors.black,
                    //         fillColor: Colors.white,
                    //         borderRadius: BorderRadius.circular(20.0),
                    //         onPressed: (int index) {
                    //           setState(() {
                    //             for (int i = 0;
                    //                 i < isSelectedListLanguage.length;
                    //                 i++) {
                    //               if (i == index) {
                    //                 isSelectedListLanguage[i] =
                    //                     !isSelectedListLanguage[i];
                    //               } else {
                    //                 isSelectedListLanguage[i] = false;
                    //               }
                    //             }
                    //           });
                    //         },
                    //         isSelected: isSelectedListLanguage,
                    //         children: const [
                    //           Padding(
                    //             padding: EdgeInsets.all(12.0),
                    //             child: Text("English"),
                    //           ),
                    //           Padding(
                    //             padding: EdgeInsets.all(12.0),
                    //             child: Text("Hindi"),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: const EdgeInsets.all(20.0),
                    //       child: ToggleButtons(
                    //         selectedColor: Colors.black,
                    //         fillColor: Colors.white,
                    //         borderRadius: BorderRadius.circular(30.0),
                    //         onPressed: (int index) {
                    //           setState(() {
                    //             for (int i = 0;
                    //                 i < isSelectedList.length;
                    //                 i++) {
                    //               if (i == index) {
                    //                 isSelectedList[i] = !isSelectedList[i];
                    //               } else {
                    //                 isSelectedList[i] = false;
                    //               }
                    //             }
                    //           });
                    //         },
                    //         isSelected: isSelectedList,
                    //         children: const [
                    //           Padding(
                    //             padding: EdgeInsets.all(12.0),
                    //             child: Text("C"),
                    //           ),
                    //           Padding(
                    //             padding: EdgeInsets.all(12.0),
                    //             child: Text("F"),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ],
                    // ),
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
                  color: HexColor('#91B8DE'),
                  child: Column(
                    children: [
                      Container(
                        color: const Color.fromRGBO(0, 0, 0, 0.2),
                        width: double.infinity,
                        height: 30.0,
                        child: Center(
                          child: Text(
                            "City Name goes Here as on ${DateTime.now().hour}:${DateTime.now().minute} ${DateTime.now().timeZoneName}",
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
                        child: const Text.rich(TextSpan(
                          children: [
                            TextSpan(
                              text: "34",
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
                            TextSpan(
                              text: "Description Goes Here",
                              style: TextStyle(
                                fontSize: 30,
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
                height: 10.0,
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
                        children: const [
                          Text.rich(TextSpan(
                            children: [
                              TextSpan(
                                text: "40",
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
                              Text("High/Low"),
                              Text("34/33"),
                            ],
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text("Humidity"),
                              Text(
                                "455",
                              ),
                            ],
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text("Pressure"),
                              Text("455"),
                            ],
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text("Visibility"),
                              Text("123 mi"),
                            ],
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text("Wind"),
                              Text("230 mph"),
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
