import 'dart:async';

import 'package:flutter_fullscreen/flutter_fullscreen.dart';
import 'package:moon_design/moon_design.dart';
import 'package:presale/src/di/di.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

abstract class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  void initAndRun() => runZoned<void>(
    () => _init().whenComplete(_run),
    zoneSpecification: ZoneSpecification(print: _print),
  );

  Future<void> _init() async {
    _ensureWidgetsInitialized();
    await FullScreen.ensureInitialized();
    await _initAppComponents();
  }

  void _run() => runApp(this);

  void _ensureWidgetsInitialized(){
    WidgetsFlutterBinding.ensureInitialized();

  }

  Future<void> _initAppComponents() async {
    await di.initConfig();
    await di.init();

  }

  void _print(Zone self, ZoneDelegate parent, Zone zone, String message) {
    if (!kReleaseMode) parent.print(zone, "Intercepted: $message");
  }
}

class ServiceCalcApp extends App {
  const ServiceCalcApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: const Color(0xFFF6F7F9), // Gohan light.
        extensions: <ThemeExtension<dynamic>>[
          MoonTheme(
            tokens: MoonTokens.light.copyWith(
              colors: mdsLightColors,
              typography: MoonTypography.typography.copyWith(
                heading: MoonTypography.typography.heading.apply(
                  fontFamily: "DMSans",
                  fontWeightDelta: -1,
                  fontVariations: [const FontVariation('wght', 500)],
                ),
                body: MoonTypography.typography.body.apply(
                  fontFamily: "DMSans",
                ),
              ),
            ),
          ),
        ],
      ),
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF1F1F1F), // Gohan dark.
        extensions: <ThemeExtension<dynamic>>[
          MoonTheme(
            tokens: MoonTokens.dark.copyWith(
              colors: mdsDarkColors,
              typography: MoonTypography.typography.copyWith(
                heading: MoonTypography.typography.heading.apply(
                  fontFamily: "DMSans",
                  fontWeightDelta: -1,
                  fontVariations: [const FontVariation('wght', 500)],
                ),
                body: MoonTypography.typography.body.apply(
                  fontFamily: "DMSans",
                ),
              ),
            ),
          ),
        ],
      ),
      routerConfig: di.appGoRouter,
    );
  }
}
