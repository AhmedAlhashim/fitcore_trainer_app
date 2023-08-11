import 'package:flutter/material.dart';
import 'timer_util.dart'; // Import the TimerUtil class

class PlankPageView extends StatefulWidget {
  late final Duration currentPlankDuration;
  final Duration longestPlankDuration;
  final bool isPlankActive;
  final VoidCallback togglePlankTimer;

  PlankPageView({
    required this.currentPlankDuration,
    required this.longestPlankDuration,
    required this.isPlankActive,
    required this.togglePlankTimer,
  });

  @override
  _PlankPageViewState createState() => _PlankPageViewState();
}

class _PlankPageViewState extends State<PlankPageView> {
  late TimerUtil _timerUtil;

  @override
  void initState() {
    super.initState();
    _timerUtil = TimerUtil();
  }

  @override
  void dispose() {
    _timerUtil.stopTimer();
    super.dispose();
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');

    final minutes = twoDigits(duration.inMinutes);
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    // final milliseconds = (duration.inMilliseconds % 1000) ~/ 10; // Get milliseconds from 0 to 99

    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Tap the circle to start the timer',
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              widget.togglePlankTimer();
              if (widget.isPlankActive) {
                _timerUtil.startTimer((elapsedTime) {
                  // setState(() {
                  //   widget.currentPlankDuration = Duration(milliseconds: elapsedTime);
                  // });
                });
              } else {
                _timerUtil.stopTimer();
              }
            },
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF4DB6AC).withOpacity(0.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    spreadRadius: 5,
                    blurRadius: 20,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  widget.isPlankActive
                      ? formatDuration(widget.currentPlankDuration)
                      : widget.longestPlankDuration.inSeconds > 0
                      ? 'Currant Plank\n${formatDuration(widget.currentPlankDuration)}'
                      : 'Start',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 100),
          Text(
            'Your Longest Plank:',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text(
            formatDuration(widget.longestPlankDuration),
            style: TextStyle(
              fontSize: 32,
              color: Color(0xFF4DB6AC),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
