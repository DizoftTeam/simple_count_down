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
  bool _isRestart = false;

  @override
  Widget build(BuildContext context) {
    final IconData buttonIcon = _isRestart
        ? Icons.refresh
        : (_isPause ? Icons.pause : Icons.play_arrow);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
      ),
      body: Center(
        child: Countdown(
          controller: controller,
          seconds: 5,
          build: (_, double time) => Text(
            time.toString(),
            style: TextStyle(
              fontSize: 100,
            ),
          ),
          interval: Duration(milliseconds: 100),
          onFinished: () {
            print('Timer is done!');
            setState(() => _isRestart = true);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(buttonIcon),
        onPressed: () {
          final isCompleted = controller.isCompleted;
          isCompleted ? controller.restart() : controller.pause();
          if (!isCompleted && !_isPause) {
            controller.resume();
          }
          if (isCompleted) {
            setState(() => _isRestart = false);
          } else {
            setState(() => _isPause = !_isPause);
          }
        },
      ),
    );
  }
}
