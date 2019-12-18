# Simple Count Down

Simple Count Down for [Flutter](http://flutter.io/)

Using for create a simple timer

# How to use

```dart
CountDown(
    seconds: 100,
    onTimer: () {
        // Make some logic
        setState(() {
            // Such like hide timer and show other widget
            _showTimer = false;
        });
    },
),
```
