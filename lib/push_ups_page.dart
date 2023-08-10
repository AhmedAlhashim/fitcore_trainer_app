import 'package:flutter/material.dart';
import 'push_ups_page_view.dart';

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
      ),
      body: PushUpsPageView(
        pushUpCount: pushUpCount,
        highestPushUpCount: highestPushUpCount,
        incrementPushUps: incrementPushUps,
        resetPushUps: resetPushUps,
      ),
    );
  }
}
