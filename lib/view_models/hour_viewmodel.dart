import 'package:flutter/material.dart';
import 'package:sober_clock/main.dart';
import 'package:sober_clock/models/hour_model.dart';

class HourViewModel {
  static DateTime now = DateTime.now();
  HourModel hourModel = HourModel(
    hour: now.hour,
    minute: now.minute,
    second: now.second,
  );

  void updateHour(DateTime date) {
    hourModel = HourModel(
      hour: date.hour,
      minute: date.minute,
      second: date.second,
    );
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
