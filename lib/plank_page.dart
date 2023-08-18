import 'dart:async';
import 'package:flutter/material.dart';
import 'plank_page_view.dart';

// Single Responsibility Principle
// Dependency Inversion Principle : High-level module (PlankPage) depends on abstractions (StatefulWidget, StatelessWidget).

class PlankPage extends StatefulWidget {
  @override
  _PlankPageState createState() => _PlankPageState();
}

class _PlankPageState extends State<PlankPage> {
  Duration longestPlankDuration = Duration(seconds: 0);
  bool isPlankActive = false;
  late DateTime plankStartTime;
  Timer? plankTimer;
  Duration currentPlankDuration = Duration(seconds: 0);

  void togglePlankTimer() {
    setState(() {
      if (isPlankActive) {
        // Stop timer and record plank time
        isPlankActive = false;
        plankTimer?.cancel();
        currentPlankDuration = DateTime.now().difference(plankStartTime);
        if (currentPlankDuration > longestPlankDuration) {
          longestPlankDuration = currentPlankDuration;
        }
      } else {
        // Start timer
        isPlankActive = true;
        plankStartTime = DateTime.now();
        currentPlankDuration = Duration(seconds: 0);
        startPlankTimer();
      }
    });
  }

  void startPlankTimer() {
    plankTimer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        currentPlankDuration = DateTime.now().difference(plankStartTime);
      });
    });
  }

  @override
  void dispose() {
    plankTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plank'),
        backgroundColor: Color(0xFF26A69A).withOpacity(0.8),

      ),
      backgroundColor: Color(0xFFe6f0fa),

      body: PlankPageView(
        isPlankActive: isPlankActive,
        currentPlankDuration: currentPlankDuration,
        longestPlankDuration: longestPlankDuration,
        togglePlankTimer: togglePlankTimer,
      ),
    );
  }
}
