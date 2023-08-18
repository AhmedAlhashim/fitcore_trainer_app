import 'package:flutter/material.dart';
import 'push_ups_page_view.dart';


// Dependency Inversion Principle (DIP):
// High-level module (PushUpsPage) depends on abstractions (StatefulWidget, StatelessWidget).
// is applied here
class PushUpsPage extends StatefulWidget {
  @override
  _PushUpsPageState createState() => _PushUpsPageState();
}

class _PushUpsPageState extends State<PushUpsPage> {
  int pushUpCount = 0;
  int highestPushUpCount = 0;

  void incrementPushUps() {
    setState(() {
      pushUpCount++;
      if (pushUpCount > highestPushUpCount) {
        highestPushUpCount = pushUpCount;
      }
    });
  }

  void resetPushUps() {
    setState(() {
      pushUpCount = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Push Ups'),
        backgroundColor: Color(0xFF26A69A).withOpacity(0.8),

      ),
      backgroundColor: Color(0xFFe6f0fa),
      body: PushUpsPageView(
        pushUpCount: pushUpCount,
        highestPushUpCount: highestPushUpCount,
        incrementPushUps: incrementPushUps,
        resetPushUps: resetPushUps,
      ),
    );
  }
}
