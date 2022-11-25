import 'dart:async';

import 'package:flutter/material.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({super.key});

  @override
  State createState() => StopWatchState();
}

class StopWatchState extends State<StopWatch> {
  int seconds = 0;
  // Timer timer = Timer.periodic(const Duration(seconds: 1), (timer) {});
  Timer? timer;
  bool isTicking = true;

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void _onTick(Timer timer) {
    setState(() {
      ++seconds;
    });
  }

  void _startTimer() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      _onTick,
    );

    setState(() {
      seconds = 0;
      isTicking = true;
    });
  }

  void _stopTimer() {
    timer?.cancel();

    setState(() {
      isTicking = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stopwatch'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '$seconds ${_secondsText()}',
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                onPressed: isTicking ? null : _startTimer,
                child: const Text('Start'),
              ),
              const SizedBox(
                width: 20,
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                onPressed: isTicking ? _stopTimer : null,
                child: const Text('Stop'),
              ),
            ],
          )
        ],
      ),
    );
  }

  String _secondsText() => seconds == 1 ? 'second' : 'seconds';
}
