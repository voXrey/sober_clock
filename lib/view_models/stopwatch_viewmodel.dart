import 'dart:async';

import 'package:sober_clock/models/stopwatch_model.dart';

class StopWatchViewModel {
  StopWatchModel stopWatchModel = StopWatchModel();

  String minutesSecondsString = '0:00';
  String millisecondsString = '00';

  void updateCurrentTimestamp() {
    if (stopWatchModel.inPause != true) {
      stopWatchModel.milliseconds++;
    }
  }

  void updateTimerStrings() {
    DateTime date =
        DateTime.fromMillisecondsSinceEpoch(stopWatchModel.milliseconds);
    String minutes = date.minute.toString();
    String seconds = date.second.toString().padLeft(2, '0');
    minutesSecondsString = '$minutes:$seconds';
    millisecondsString = date.millisecond.toString().padLeft(3, '0');
  }

  void updateVisibleButtons() {
    if (stopWatchModel.started) {
      if (stopWatchModel.inPause) {
        stopWatchModel.startButtonVisible = false;
        stopWatchModel.resetButtonVisible = true;
        stopWatchModel.pauseButtonVisible = true;
      } else {
        stopWatchModel.startButtonVisible = false;
        stopWatchModel.resetButtonVisible = false;
        stopWatchModel.pauseButtonVisible = true;
      }
    } else {
      stopWatchModel.startButtonVisible = true;
      stopWatchModel.resetButtonVisible = false;
      stopWatchModel.pauseButtonVisible = false;
    }
  }

  void startStopWatch() {
    stopWatchModel.inPause = false;
    stopWatchModel.started = true;
    stopWatchModel.stopWatchTimer = Timer.periodic(
        const Duration(milliseconds: 1), (Timer t) => updateCurrentTimestamp());
    updateVisibleButtons();
  }

  void resetStopWatch() {
    stopWatchModel.inPause = true;
    stopWatchModel.started = false;
    stopWatchModel.stopWatchTimer?.cancel();
    stopWatchModel.milliseconds = 0;
    updateVisibleButtons();
  }

  void togglePauseStopWatch() {
    stopWatchModel.inPause = stopWatchModel.inPause
        ? stopWatchModel.inPause = false
        : stopWatchModel.inPause = true;
    updateVisibleButtons();
  }
}
