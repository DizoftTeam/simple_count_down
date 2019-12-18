// Flutter libs
import 'package:flutter/material.dart';

// Other deps
import 'package:timer_count_down/timer_count_down.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo CountDown'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _showTimer = true;
  int _seconds = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Count down example',
            ),
            if (_showTimer)
              CountDown(
                seconds: _seconds,
                onTimer: () {
                  setState(() {
                    _showTimer = false;
                  });
                },
              ),
            if (!_showTimer)
              Text(
                'Timer is done!',
              ),
          ],
        ),
      ),
    );
  }
}
