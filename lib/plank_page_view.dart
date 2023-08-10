import 'package:flutter/material.dart';

class PlankPageView extends StatelessWidget {
  final Duration currentPlankDuration;
  final Duration longestPlankDuration;
  final bool isPlankActive;
  final VoidCallback togglePlankTimer;

  PlankPageView({
    required this.currentPlankDuration,
    required this.longestPlankDuration,
    required this.isPlankActive ,
    required this.togglePlankTimer,
  });

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
          SizedBox(height: 50),
          GestureDetector(
            onTap: togglePlankTimer,
            child: Container(
              width: 350,
              height: 350,
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
                  isPlankActive
                      ? '${currentPlankDuration.inSeconds}s'
                      : longestPlankDuration.inSeconds > 0
                          ? 'Record\n${longestPlankDuration.inSeconds}s'
                          : 'Start',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 80,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Your Longest Plank:',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text(
            '${longestPlankDuration.inSeconds}s',
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
