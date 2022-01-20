import 'dart:async';

import 'package:sober_clock/view_models/hour_viewmodel.dart';
import 'package:flutter/material.dart';

class HourPage extends StatefulWidget {
  const HourPage({Key? key}) : super(key: key);

  @override
  _HourPageState createState() => _HourPageState();
}

class _HourPageState extends State<HourPage> {
  HourViewModel hourViewModel = HourViewModel();

  void updateHourStrings() {
    setState(() {
      hourViewModel.updateHour();
    });
  }

  @override
  void initState() {
    hourViewModel.updateHour();
    super.initState();
    hourViewModel.hourModel.timer = Timer.periodic(
        const Duration(seconds: 1), (Timer t) => updateHourStrings());
  }

  @override
  void dispose() {
    hourViewModel.hourModel.timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
    );
  }
}
