import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/presentation/destinations/openweather/common/openwather_togglebutton.dart';
import 'package:flutter_template/presentation/destinations/openweather/common/openweather_header.dart';
import 'package:flutter_template/presentation/destinations/openweather/home/home_screen_intent.dart';
import 'package:flutter_template/presentation/destinations/openweather/home/main_home_view_model.dart';
import 'package:flutter_template/presentation/destinations/openweather/home/main_home_view_model_impl.dart';
import 'package:flutter_template/presentation/destinations/openweather/home/widgets/home_screen_card.dart';
import 'package:flutter_template/presentation/destinations/openweather/home/widgets/home_screen_feels_like_card.dart';
import 'package:hexcolor/hexcolor.dart';

class OpenWeatherHome extends ConsumerStatefulWidget {
  const OpenWeatherHome({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => OpenWeatherHomeState();
}

class OpenWeatherHomeState extends ConsumerState<OpenWeatherHome> {
  final TextEditingController _controller = TextEditingController();
  List<bool> isSelectedUnit = [true, false];
  List<bool> isSelectedLanguage = [true, false];
  @override
  Widget build(BuildContext context) {
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
                    const OpenWeatherCommonHeader(),
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
                          padding: const EdgeInsets.all(20.0),
                          child: OpenWeatherToggleButton(
                            isSelected: isSelectedLanguage,
                            toggleButtonText1: "English",
                            toggleButtonText2: 'Hindi',
                            onPressed: (int index) {
                              for (int i = 0;
                                  i < isSelectedLanguage.length;
                                  i++) {
                                setState(() {
                                  if (i == index) {
                                    isSelectedLanguage[i] = true;
                                    language = "hi";
                                  } else {
                                    isSelectedLanguage[i] = false;
                                    language = "en";
                                  }
                                });
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: OpenWeatherToggleButton(
                            isSelected: isSelectedUnit,
                            toggleButtonText1: "C",
                            toggleButtonText2: 'F',
                            onPressed: (int index) {
                              for (int i = 0; i < isSelectedUnit.length; i++) {
                                setState(() {
                                  if (i == index) {
                                    isSelectedUnit[i] = true;
                                    units = "imperial";
                                  } else {
                                    isSelectedUnit[i] = false;
                                    units = "metric";
                                  }
                                });
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              HomeScreenCard(currentWeather: newVM.currentWeather),
              const SizedBox(height: 10.0),
              HomeScreenFeelsLikeCard(currentWeather: newVM.currentWeather),
            ],
          ),
        ),
      ),
    );
  }
}
