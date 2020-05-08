# Simple Count Down

A highly customizable countdown widget for [Flutter](http://flutter.dev/), with support for custom styling, intervals, and onFinished callbacks.


# How to use

```dart
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Countdown(
      seconds: 20,
      build: (_, double time) => Text(time.toString()),
      interval: Duration(milliseconds: 100),
      onFinished: () {
        print('Timer is done!');
      },
    );
  }
}
```

# Installing
Go to the [package](https://pub.dev/packages/timer_count_down) on pub.dev, check the latest version, and add it to your `pubspec.yaml` file in the dependency section. 
