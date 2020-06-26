import 'package:flutter/widgets.dart';

///
/// Controller for Count down
///
class CountdownController {
  // Called when called `pause` method
  VoidCallback onPause;

  // Called when called `resume` method
  VoidCallback onResume;

  // Called when restarting the timer
  VoidCallback onRestart;

  ///
  /// Checks if the timer is running and enables you to take actions according to that.
  /// if the timer is still active, `isCompleted` returns `false` and vice versa.
  ///
  /// for example:
  ///
  /// ``` dart
  ///   _controller.isCompleted ? _controller.restart() : _controller.pause();
  /// ```
  ///
  bool isCompleted;

  ///
  /// Constructor
  ///
  CountdownController();

  ///
  /// Set timer in pause
  ///
  pause() {
    if (this.onPause != null) {
      this.onPause();
    }
  }

  setOnPause(VoidCallback onPause) {
    this.onPause = onPause;
  }

  ///
  /// Resume from pause
  ///
  resume() {
    if (this.onResume != null) {
      this.onResume();
    }
  }

  setOnResume(VoidCallback onResume) {
    this.onResume = onResume;
  }

  ///
  /// Restart timer from cold
  ///
  restart() {
    if (this.onRestart != null) {
      this.onRestart();
    }
  }

  setOnRestart(VoidCallback onRestart) {
    this.onRestart = onRestart;
  }
}
