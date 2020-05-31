import 'package:flutter/widgets.dart';

///
/// Controller for Count down
///
class CountdownController {
  // Called when called `pause` method
  VoidCallback onPause;

  // Called when called `resume` method
  VoidCallback onResume;

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
}
