import 'package:flutter/widgets.dart';

///
/// Controller for Count down
///
class CountdownController {
  // Called when called `pause` method
  VoidCallback onPause;

  // Called when called `resume` method
  VoidCallback onResume;

  // called to restart the timer
  VoidCallback onRestart;

  //is timer active
  bool isCompleted = false;

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
  /// restart timer from cold
  ///
  restart() {
    if (this.onRestart != null) {
      this.onRestart();
    }
  }

  serOnRestart(VoidCallback onRestart) {
    this.onRestart = onRestart;
  }
}
