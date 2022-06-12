import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/presentation/base/page/base_page.dart';
import 'package:flutter_template/presentation/destinations/openweather/home/home_screen_intent.dart';
import 'package:flutter_template/presentation/destinations/openweather/home/home_screen_state.dart';
import 'package:flutter_template/presentation/destinations/openweather/home/main_home_view_model.dart';
import 'package:flutter_template/presentation/entity/screen/screen.dart';

class OWHome extends ConsumerWidget {
  const OWHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BasePage<OpenWeatherHomeScreen, OpenWeatherHomeScreenState,
            OpenWeatherViewModel>(
        viewModelProvider: openWeatherHomeViewModel,
        body: const Text("Something"),
        appBarActions: () => [
              IconButton(
                onPressed: () {
                  final viewModel =
                      ref.watch(openWeatherHomeViewModel.notifier);
                  viewModel.onIntent(
                    OpenWeatherHomeIntent.search(searchTerm: 'Pune'),
                  );
                },
                icon: Icon(Icons.info),
              ),
            ]);
  }
}
