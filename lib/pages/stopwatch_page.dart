import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sober_clock/view_models/stopwatch_viewmodel.dart';

class StopWatchPage extends StatefulWidget {
  const StopWatchPage({Key? key}) : super(key: key);

  @override
  _StopWatchPageState createState() => _StopWatchPageState();
}

class _StopWatchPageState extends State<StopWatchPage> {
  StopWatchViewModel stopWatchViewModel = StopWatchViewModel();

  void updateTimerStrings() {
    setState(() => stopWatchViewModel.updateTimerStrings());
  }

  void startPressedHandler() {
    setState(() => stopWatchViewModel.startStopWatch());
  }

  void resetPressedHandler() {
    setState(() => stopWatchViewModel.resetStopWatch());
  }

  void pausePressedHandler() {
    setState(() => stopWatchViewModel.togglePauseStopWatch());
  }

  @override
  void initState() {
    stopWatchViewModel.updateTimerStrings();
    super.initState();
    stopWatchViewModel.stopWatchModel.timer = Timer.periodic(
        const Duration(milliseconds: 1), (Timer t) => updateTimerStrings());
  }

  @override
  void dispose() {
    stopWatchViewModel.stopWatchModel.timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        stopWatchViewModel.minutesSecondsString,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 70),
      ),
      Text(
        stopWatchViewModel.millisecondsString,
        textAlign: TextAlign.right,
        style: const TextStyle(fontSize: 45),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(
              visible: stopWatchViewModel.stopWatchModel.startButtonVisible,
              child: SizedBox(
                  width: 100,
                  height: 100,
                  child: ElevatedButton(
                      onPressed: startPressedHandler,
                      child: const Text("Start"),
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(90),
                      )))))),
          Visibility(
              visible: stopWatchViewModel.stopWatchModel.pauseButtonVisible,
              child: SizedBox(
                  width: 100,
                  height: 100,
                  child: ElevatedButton(
                      onPressed: pausePressedHandler,
                      child: const Text("Pause"),
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(90),
                      )))))),
          const SizedBox(width: 50),
          Visibility(
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              visible: stopWatchViewModel.stopWatchModel.resetButtonVisible,
              child: SizedBox(
                  width: 100,
                  height: 100,
                  child: ElevatedButton(
                      onPressed: resetPressedHandler,
                      child: const Text("Reset"),
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(90),
                      ))))))
        ],
      )
    ]));
  }
}
