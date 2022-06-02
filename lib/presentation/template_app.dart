import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/flavors/flavor.dart';
import 'package:flutter_template/flavors/flavor_config.dart';
import 'package:flutter_template/navigation/base/app_router.dart';
import 'package:flutter_template/presentation/destinations/openweather/main_home.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

class TemplateApp extends StatelessWidget {
  TemplateApp({Key? key}) : super(key: key);

  final AppRouter _appRouter = GetIt.I.get();

  @override
  Widget build(BuildContext context) {
    const enableDevicePreview =
        String.fromEnvironment("enableDevicePreview") == "true";
    final useDevicePreview = enableDevicePreview &&
        kDebugMode &&
        FlavorConfig.instance.flavor == Flavor.dev;

    // return ProviderScope(
    //   child: ThemeStateListener(
    //     builder: (themeState) => DynamicColorBuilder(
    //       builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
    //         final lightTheme = (themeState.isDynamic && lightDynamic != null)
    //             ? buildTheme(lightDynamic.harmonized())
    //             : material3LightTheme;
    //         final darkTheme = (themeState.isDynamic && darkDynamic != null)
    //             ? buildTheme(darkDynamic.harmonized())
    //             : material3DarkTheme;
    //         return MaterialApp.router(
    //           useInheritedMediaQuery: useDevicePreview,
    //           theme: lightTheme,
    //           darkTheme: darkTheme,
    //           themeMode: themeState.themeMode,
    //           routerDelegate: _appRouter.delegate(
    //             initialRoutes: [
    //               const OpenWeatherHomeScreen(),
    //             ],
    //           ),
    //           routeInformationParser: _appRouter.defaultRouteParser(),
    //           localizationsDelegates: context.localizationDelegates,
    //           supportedLocales: context.supportedLocales,
    //           locale: context.locale,
    //           scaffoldMessengerKey: scaffoldMessengerKey,
    //         );
    //       },
    //     ),
    //   ),
    // );
    return ProviderScope(
      child: MaterialApp(
        home: OpenWeatherHome(),
        theme: ThemeData(
          fontFamily: GoogleFonts.dmSans().fontFamily,
        ),
      ),
    );
  }
}
