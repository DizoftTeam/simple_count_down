import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_controller.dart';

import 'package:timer_count_down/timer_count_down.dart';

void main() => runApp(MyApp());

///
/// Test app
///
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Countdown Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: 'Flutter Demo Countdown',
      ),
    );
  }
}

///
/// Home page
///
class MyHomePage extends StatefulWidget {
  ///
  /// AppBar title
  ///
  final String title;

  MyHomePage({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

///
/// Page state
///
class _MyHomePageState extends State<MyHomePage> {
  final CountdownController controller = CountdownController();

  bool _isPause = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
      ),
      body: Center(
        child: Countdown(
          controller: controller,
          seconds: 20,
          build: (_, double time) => Text(time.toString()),
          interval: Duration(
            milliseconds: 100,
          ),
          onFinished: () {
            print('Timer is done!');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          _isPause ? Icons.pause : Icons.play_arrow,
        ),
        onPressed: () {
          if (_isPause) {
            controller.pause();
          } else {
            controller.resume();
          }

          setState(() {
            _isPause = !_isPause;
          });
        },
      ),
    );
  }
}
