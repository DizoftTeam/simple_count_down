import 'dart:async';

import 'package:timer_count_down/timer_controller.dart';
import 'package:flutter/widgets.dart';

///
/// Simple countdown timer.
///
class Countdown extends StatefulWidget {
  // Length of the timer
  final int seconds;

  // Build method for the timer
  final Widget Function(BuildContext, double) build;

  // Called when finished
  final Function onFinished;

  // Build interval
  final Duration interval;

  // Controller
  final CountdownController controller;

  Countdown({
    Key key,
    @required this.seconds,
    @required this.build,
    this.interval = const Duration(seconds: 1),
    this.onFinished,
    this.controller,
  }) : super(key: key);

  @override
  _CountdownState createState() => _CountdownState();
}

///
/// State of timer
///
class _CountdownState extends State<Countdown> {
  // Timer
  Timer _timer;

  // Current seconds
  int _currentMicroSeconds;

  @override
  void initState() {
    _currentMicroSeconds = widget.seconds * 1000000;

    widget.controller?.setOnPause(_onTimerPaused);
    widget.controller?.setOnResume(_onTimerResumed);
    widget.controller?.serOnRestart(_onTimerRestart);

    _startTimer();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.build(
      context,
      _currentMicroSeconds / 1000000,
    );
  }

  @override
  void dispose() {
    if (_timer?.isActive == true) {
      _timer?.cancel();
    }

    super.dispose();
  }

  ///
  /// Then timer paused
  ///
  void _onTimerPaused() {
    if (_timer?.isActive == true) {
      _timer?.cancel();
    }
  }

  ///
  /// Then timer resumed
  ///
  void _onTimerResumed() {
    _startTimer();
  }

  void _onTimerRestart() {
    setState(() => _currentMicroSeconds = widget.seconds * 1000000);
    _startTimer();
  }

  void _startTimer() {
    if (_timer?.isActive == true) {
      _timer.cancel();
    }

    if (_currentMicroSeconds != 0) {
      _timer = Timer.periodic(
        widget.interval,
        (Timer timer) {
          if (_currentMicroSeconds == 0) {
            timer.cancel();

            if (widget.onFinished != null) {
              widget.onFinished();
            }
          } else {
            setState(() {
              _currentMicroSeconds =
                  _currentMicroSeconds - widget.interval.inMicroseconds;
            });
          }
        },
      );
    }
  }
}
