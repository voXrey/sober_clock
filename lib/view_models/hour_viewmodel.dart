import 'package:flutter/material.dart';
import 'package:sober_clock/main.dart';
import 'package:sober_clock/models/hour_model.dart';

class HourViewModel {
  HourModel hourModel = HourModel();

  void updateHour() {
    DateTime date = DateTime.now();
    hourModel.hour = date.hour;
    hourModel.minute = date.minute;
    hourModel.second = date.second;
  }

  String getHourMinuteString() {
    return '${hourModel.hour.toString().padLeft(2, "0")}:${hourModel.minute.toString().padLeft(2, "0")}';
  }

  String getSecondString() {
    return hourModel.second.toString().padLeft(2, '0');
  }

  void onDoubleTap() {
    MyApp.themeNotifier.value = MyApp.themeNotifier.value == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
  }
}
