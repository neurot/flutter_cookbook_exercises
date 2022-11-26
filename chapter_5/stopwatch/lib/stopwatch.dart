import 'dart:async';

import 'package:flutter/material.dart';

class StopWatch extends StatefulWidget {
  String name;

  StopWatch({super.key, this.name = '', this.email = ''});

  static const route = '/stopwatch';

  final String email;

  @override
  State createState() => StopWatchState();
}

class StopWatchState extends State<StopWatch> {
  int milliseconds = 0;
  // Timer timer = Timer.periodic(const Duration(seconds: 1), (timer) {});
  Timer? timer;
  bool isTicking = true;
  final laps = <int>[];
  final itemHeight = 60.0;
  final scrollController = ScrollController();

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void _lap() {
    setState(() {
      laps.add(milliseconds -
          (laps.isEmpty
              ? 0
              : laps.reduce((value, element) => value + element)));
    });
    scrollController.animateTo(
      itemHeight * laps.length,
      duration: const Duration(milliseconds: 200),
      curve: Curves.linear,
    );
  }

  void _onTick(Timer timer) {
    setState(() {
      milliseconds += 100;
    });
  }

  void _startTimer() {
    timer = Timer.periodic(
      const Duration(milliseconds: 100),
      _onTick,
    );

    setState(() {
      laps.clear();
      milliseconds = 0;
      isTicking = true;
    });
  }

  void _stopTimer() {
    timer?.cancel();

    setState(() {
      isTicking = false;
    });
  }

  Widget _buildLapDisplay() {
    return ListView.builder(
      controller: scrollController,
      itemExtent: itemHeight,
      itemCount: laps.length,
      itemBuilder: (context, index) {
        final milliseconds = laps[index];
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 50),
          title: Text('Lap ${index + 1}'),
          trailing: Text(_secondsText(milliseconds)),
        );
      },
    );
    // // Building all widgets at once
    // ListView(
    //   children: [
    //     for (int milliseconds in laps)
    //       ListTile(
    //         title: Text(_secondsText(milliseconds)),
    //       )
    //   ],
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: Column(
        children: [
          Expanded(child: _buildCounter(context)),
          Expanded(child: _buildLapDisplay()),
        ],
      ),
    );
  }

  Widget _buildCounter(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColorLight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Lap ${laps.length + 1}',
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(color: Colors.white),
          ),
          Text(
            _secondsText(milliseconds),
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(
            height: 20,
          ),
          _buildControls()
        ],
      ),
    );
  }

  Widget _buildControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          onPressed: isTicking ? null : _startTimer,
          child: const Text('Start'),
        ),
        const SizedBox(
          width: 20,
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
          ),
          onPressed: isTicking ? _lap : null,
          child: const Text('Lap'),
        ),
        const SizedBox(
          width: 20,
        ),
        TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          onPressed: isTicking ? _stopTimer : null,
          child: const Text('Stop'),
        ),
      ],
    );
  }

  String _secondsText(int milliseconds) {
    final seconds = milliseconds / 1000;
    return seconds == 1 ? '$seconds second' : '$seconds seconds';
  }
}
