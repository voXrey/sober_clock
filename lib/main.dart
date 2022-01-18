import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'clock',
      theme: ThemeData(fontFamily: 'Dongle'),
      home: const MyHomePage(title: 'clock'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // ignore: unused_element
  String hourMinute = '00:00';
  String seconds = '00';

  List getHourString(DateTime datetime) {
    String _hourMinute =
        '${(datetime.hour).toString().padLeft(2, "0")}:${(datetime.minute).toString().padLeft(2, "0")}';
    String _seconds = datetime.second.toString().padLeft(2, '0');
    List hours = [_hourMinute, _seconds];
    return hours;
  }

  void updateHour() {
    setState(() {
      DateTime now = DateTime.now();
      List hours = getHourString(now);
      hourMinute = hours[0];
      seconds = hours[1];
    });
  }

  @override
  void initState() {
    super.initState();
    updateHour();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,
        overlays: []);
    // ignore: unused_local_variable
    var timer =
        Timer.periodic(const Duration(seconds: 1), (Timer t) => updateHour());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            hourMinute,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 70),
          ),
          Text(
            seconds,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 45),
          )
        ])));
  }
}
