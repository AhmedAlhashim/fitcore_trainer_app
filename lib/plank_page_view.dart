import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlankPageView extends StatelessWidget {
  final bool isPlankActive;
  final Duration currentPlankDuration;
  final Duration longestPlankDuration;
  final VoidCallback togglePlankTimer;

  PlankPageView({
    required this.isPlankActive,
    required this.currentPlankDuration,
    required this.longestPlankDuration,
    required this.togglePlankTimer,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: togglePlankTimer,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Center(
                    child: isPlankActive
                        ? Text(
                            '${currentPlankDuration.inSeconds}s',
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          )
                        : longestPlankDuration.inSeconds > 0
                            ? Text(
                                'Record\n${longestPlankDuration.inSeconds}s',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              )
                            : Text(
                                'Start',
                                style: TextStyle(
                                    fontSize: 30, color: Colors.white),
                              ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Text('Current Plank: ${currentPlankDuration.inSeconds} secondsn\n'),
        Text(
          'Record: ${longestPlankDuration.inSeconds}s',
          textAlign: TextAlign.center,
          style: GoogleFonts.reemKufi(
            fontSize: 16, // You can adjust the font size as needed
          ),
        ),
]
    ),
    );
  }
}
