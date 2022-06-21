import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/presentation/destinations/openweather/common/openweather_header.dart';
import 'package:flutter_template/presentation/destinations/openweather/home/main_home_view_model_impl.dart';
import 'package:flutter_template/presentation/destinations/openweather/pollution/pollution_screen_intent.dart';
import 'package:flutter_template/presentation/destinations/openweather/pollution/pollution_screen_viewmodel.dart';
import 'package:flutter_template/presentation/destinations/openweather/pollution/widgets/pollution_screen_aqi_card.dart';
import 'package:flutter_template/presentation/destinations/openweather/pollution/widgets/pollution_screen_today_card.dart';
import 'package:hexcolor/hexcolor.dart';

class PollutionScreen extends ConsumerWidget {
  PollutionScreen({Key? key}) : super(key: key);

  final TextEditingController _controller = TextEditingController();

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
                height: 166.0,
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
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: PollutionScreenAQICard(
                    openWeatherPollutionInfo:
                        newPollutionScreenViewModel.openWeatherPollutionInfo),
              ),
              const SizedBox(height: 25.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: PollutionScreenTodayCard(
                    openWeatherPollutionInfo:
                        newPollutionScreenViewModel.openWeatherPollutionInfo),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
