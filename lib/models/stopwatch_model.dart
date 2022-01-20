import 'dart:async';

class StopWatchModel {
  int milliseconds = 0;
  bool inPause = true;
  bool started = false;

  bool startButtonVisible = true;
  bool resetButtonVisible = false;
  bool pauseButtonVisible = false;

  Timer? timer;
  Timer? stopWatchTimer;

  StopWatchModel();
}
