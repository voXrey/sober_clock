import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sober_clock/pages/hour_page.dart';
import 'package:sober_clock/pages/stopwatch_page.dart';
import 'package:sober_clock/view_models/hour_viewmodel.dart';

class PageHandler extends StatefulWidget {
  const PageHandler({Key? key}) : super(key: key);

  @override
  _PageHandlerState createState() => _PageHandlerState();
}

class _PageHandlerState extends State<PageHandler> {
  HourViewModel hourViewModel = HourViewModel();

  void _handleDoubleTap() {
    hourViewModel.onDoubleTap();
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.immersiveSticky,
      overlays: [],
    );
  }

  @override
  Widget build(BuildContext context) {
    final _tapPages = <Widget>[
      const HourPage(),
      const StopWatchPage(),
    ];

    return DefaultTabController(
        length: _tapPages.length,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onDoubleTap: _handleDoubleTap,
          child: Scaffold(
            body: TabBarView(
              children: _tapPages,
            ),
          ),
        ));
  }
}
