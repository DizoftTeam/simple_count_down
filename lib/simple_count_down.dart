// Dart libs
import 'dart:async';

// Flutter libs
import 'package:flutter/widgets.dart';

///
/// Simple count down (timer)
///
class CountDown extends StatefulWidget {
  // Seconds
  final int seconds;

  // Callback when timer is done
  final VoidCallback onTimer;

  // Duration
  final Duration duration;

  // Style of text
  final TextStyle style;

  ///
  /// Simple count down (timer)
  ///
  CountDown({
    Key key,
    @required this.seconds,
    this.onTimer,
    this.duration = const Duration(seconds: 1),
    this.style = const TextStyle(),
  }) : super(key: key);

  @override
  _CountDownState createState() => _CountDownState();
}

///
/// Count down state
///
class _CountDownState extends State<CountDown> {
  // Timer
  Timer _timer;

  // Current seconds
  int _currentSeconds;

  @override
  void initState() {
    _currentSeconds = widget.seconds;

    _timer = Timer.periodic(
      widget.duration,
      // Run callback with custom [duration]
      (Timer timer) {
        if (_currentSeconds < 1) {
          // In this case timer whill be done
          // Thas why we do not need check it on build function

          // Stop timer
          timer.cancel();

          // Call callback if not null
          if (widget.onTimer != null) {
            widget.onTimer();
          }
        } else {
          setState(() {
            // TIP: _currentSeconds -= 1 make insane!
            _currentSeconds = _currentSeconds - 1;
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
  Widget build(BuildContext context) => _getRoot(context);

  ///
  /// Build root of widget
  ///
  Widget _getRoot(BuildContext context) {
    return Container(
      child: _buildCountDown(context),
    );
  }

  ///
  /// Build count down timer
  ///
  Text _buildCountDown(BuildContext context) {
    int minutes = (_currentSeconds / 60).floor();
    String minutesString = minutes.toString().padLeft(2, '0');

    int tempSeconds = (_currentSeconds - (minutes * 60));
    int seconds = tempSeconds > 60 ? (tempSeconds / 60).floor() : tempSeconds;
    String secondsString = seconds.toString().padLeft(2, '0');

    return Text(
      '$minutesString:$secondsString',
      style: widget.style,
    );
  }
}
