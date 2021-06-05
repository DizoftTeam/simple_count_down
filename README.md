# Simple Count Down

![](https://badges.fyi/github/latest-tag/DizoftTeam/simple_count_down)
![](https://badges.fyi/github/stars/DizoftTeam/simple_count_down)
![](https://badges.fyi/github/license/DizoftTeam/simple_count_down)

A highly customizable countdown widget for [Flutter](https://flutter.dev/), with support for custom styling, intervals, and onFinished callbacks.

## Preview

<img src="https://raw.githubusercontent.com/DizoftTeam/simple_count_down/master/assets/preview.gif" width="320" height="640" />

## How to use

Simple example below. For full example check `example` folder.

```dart
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Countdown(
      seconds: 20,
      build: (BuildContext context, double time) => Text(time.toString()),
      interval: Duration(milliseconds: 100),
      onFinished: () {
        print('Timer is done!');
      },
    );
  }
}
```

For pause, restart and resume you need to use `CountdownController`. For example check [example as is](./example)

## Installing

Go to the [package](https://pub.dev/packages/timer_count_down) on pub.dev, check the latest version, and add it to your `pubspec.yaml` file in the dependency section.
