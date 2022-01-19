import 'dart:async';

import 'package:sober_clock/view_models/hour_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HourPage extends StatefulWidget {
  const HourPage({Key? key}) : super(key: key);

  @override
  _HourPageState createState() => _HourPageState();
}

class _HourPageState extends State<HourPage> {
  HourViewModel hourViewModel = HourViewModel();

  void updateHourStrings() {
    setState(() => hourViewModel.updateHour(DateTime.now()));
  }

  void _handleDoubleTap() {
    hourViewModel.onDoubleTap();
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(
        const Duration(seconds: 1), (Timer t) => updateHourStrings());
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.immersiveSticky,
      overlays: [],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      behavior: HitTestBehavior.opaque,
      onDoubleTap: _handleDoubleTap,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            hourViewModel.getHourMinuteString(),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 70),
          ),
          Text(
            hourViewModel.getSecondString(),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 45),
          )
        ],
      )),
    ));
  }
}
