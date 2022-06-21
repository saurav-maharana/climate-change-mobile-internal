import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/presentation/destinations/openweather/home/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class TemplateApp extends StatelessWidget {
  const TemplateApp({Key? key}) : super(key: key);

  // final AppRouter _appRouter = GetIt.I.get();

  @override
  Widget build(BuildContext context) {
    // const enableDevicePreview =
    //     String.fromEnvironment("enableDevicePreview") == "true";
    // final useDevicePreview = enableDevicePreview &&
    //     kDebugMode &&
    //     FlavorConfig.instance.flavor == Flavor.dev;

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
        home: const OpenWeatherHome(),
        theme: ThemeData(
          fontFamily: GoogleFonts.dmSans().fontFamily,
        ),
      ),
    );
  }
}
