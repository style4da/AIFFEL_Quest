import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentCycle = 0;
  bool _isConcentration = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('뽀모도로 타이머'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '현재 사이클: ${_currentCycle + 1}',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                _isConcentration ? '집중 시간' : '휴식 시간',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _startTimer();
          },
          child: Icon(Icons.play_arrow),
        ),
      ),
    );
  }

  void _startTimer() {
    _currentCycle++;
    _isConcentration = true;

    Timer.periodic(Duration(minutes: _isConcentration ? 25 : 5), (timer) {
      setState(() {
        _isConcentration = !_isConcentration;
      });

      if (_currentCycle == 4 && _isConcentration) {
        timer.cancel();
        _showLongBreakDialog();
      } else if (_currentCycle == 4 && !_isConcentration) {
        timer.cancel();
        _startTimer();
      }
    });
  }

  void _showLongBreakDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('긴 휴식 시간'),
          content: Text('15분 동안 휴식을 취하세요.'),
          actions: [
            TextButton(
              child: Text('확인'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

