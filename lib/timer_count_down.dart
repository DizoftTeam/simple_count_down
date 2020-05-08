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
  final Function(double) onFinished;

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
  int _currentSeconds;

  @override
  void initState() {
    this._currentSeconds = widget.seconds * this.widget.interval.inMicroseconds;

    _timer = Timer.periodic(
      this.widget.interval,
      (Timer timer) {
        if (_currentSeconds == 0) {
          // Stop timer
          timer.cancel();
          if (this.widget.onFinished != null) {
            this.widget.onFinished(
                _currentSeconds / this.widget.interval.inMicroseconds);
          }
        } else {
          setState(() {
            _currentSeconds -= this.widget.interval.inMicroseconds;
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
  Widget build(BuildContext context) => this
      .widget
      .build(context, _currentSeconds / this.widget.interval.inMicroseconds);
}
