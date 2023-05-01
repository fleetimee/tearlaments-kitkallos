import 'dart:async';
import 'package:flutter/material.dart';

class CountdownTimer extends StatefulWidget {
  const CountdownTimer({Key? key}) : super(key: key);

  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  Timer? _timer;
  String _countdown = '';

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    var duration = DateTime(2023, 5, 7).difference(DateTime.now());
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (duration.inSeconds <= 0) {
          _countdown = 'Acara sudah berakhir';
          _timer?.cancel();
        } else {
          _countdown =
              '${duration.inDays}d ${duration.inHours % 24}h ${duration.inMinutes % 60}m ${duration.inSeconds % 60}s';
          duration -= const Duration(seconds: 1);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _countdown,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
