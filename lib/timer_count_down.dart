import 'dart:async';
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

  Countdown({
    Key key,
    @required this.seconds,
    @required this.build,
    this.onFinished,
    this.interval = const Duration(seconds: 1),
  }) : super(key: key);

  @override
  _CountdownState createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> {
  // Timer
  Timer _timer;

  // Current seconds
  int _currentMicroSeconds;

  @override
  void initState() {
    this._currentMicroSeconds = widget.seconds * 1000000;

    _timer = Timer.periodic(
      this.widget.interval,
      (Timer timer) {
        if (_currentMicroSeconds == 0) {
          // Stop timer
          timer.cancel();
          if (this.widget.onFinished != null) {
            this.widget.onFinished();
          }
        } else {
          setState(() {
            _currentMicroSeconds -= this.widget.interval.inMicroseconds;
          });
        }
      },
    );

    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => this.widget.build(
    context,
    _currentMicroSeconds / 1000000);
}
