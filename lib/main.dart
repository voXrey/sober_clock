import 'package:flutter/material.dart';
import 'package:sober_clock/pages/page_handler.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  brightness: Brightness.light,
  textTheme: ThemeData.light().textTheme,
);

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: Colors.black,
  brightness: Brightness.dark,
  textTheme: ThemeData.dark().textTheme,
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.system);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            debugShowMaterialGrid: false,
            title: 'Sober Clock',
            themeMode: currentMode,
            theme: lightTheme,
            darkTheme: darkTheme,
            home: const PageHandler(),
          );
        });
  }
}
