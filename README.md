# Simple Count Down

[![pub](https://img.shields.io/pub/v/timer_count_down?logo=dart)](https://pub.dev/packages/timer_count_down)
![](https://badges.fyi/github/latest-tag/DizoftTeam/simple_count_down)
![](https://badges.fyi/github/stars/DizoftTeam/simple_count_down)
![](https://badges.fyi/github/license/DizoftTeam/simple_count_down)

A highly customizable countdown widget for [Flutter](https://flutter.dev/), with support for custom styling, intervals, and onFinished callbacks.

## Preview

<img src="https://raw.githubusercontent.com/DizoftTeam/simple_count_down/master/assets/preview.gif" width="320" height="640" />

## Installing

* Add the latest version of the package to your [pubspec.yaml](https://github.com/DizoftTeam/simple_count_down/blob/master/example/pubspec.yaml) file in the dependency section.

```yaml
  dependencies:
    flutter:
      sdk: flutter

    timer_count_down: ^2.2.2
```
Run this in your terminal or click on `pub get`

```sh
$ flutter pub get
```

## How to use

Simple example for the usage of the package is shown below.

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
## Example

For pause, restart and resume you need to use `CountdownController`.
For an example of using the package, please check the [example](./example) folder. Otherwise, keep reading and keep going!
