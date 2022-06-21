import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/presentation/destinations/openweather/common/openwather_togglebutton.dart';
import 'package:flutter_template/presentation/destinations/openweather/common/openweather_header.dart';
import 'package:flutter_template/presentation/destinations/openweather/home/home_screen_intent.dart';
import 'package:flutter_template/presentation/destinations/openweather/home/main_home_view_model.dart';
import 'package:flutter_template/presentation/destinations/openweather/home/widgets/home_screen_card.dart';
import 'package:flutter_template/presentation/destinations/openweather/home/widgets/home_screen_feels_like_card.dart';
import 'package:hexcolor/hexcolor.dart';

class OpenWeatherHome extends ConsumerWidget {
  OpenWeatherHome({Key? key}) : super(key: key);

  final TextEditingController _controller = TextEditingController();

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
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: OpenWeatherToggleButton(
                            isSelected: [true, false],
                            toggleButtonText1: "English",
                            toggleButtonText2: 'Hindi',
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: OpenWeatherToggleButton(
                            isSelected: [true, false],
                            toggleButtonText1: "C",
                            toggleButtonText2: 'F',
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
