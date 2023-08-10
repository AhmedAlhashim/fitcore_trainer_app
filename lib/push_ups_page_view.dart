import 'package:flutter/material.dart';

class PushUpsPageView extends StatelessWidget {
  final int pushUpCount;
  final int highestPushUpCount;
  final VoidCallback incrementPushUps;
  final VoidCallback resetPushUps;

  PushUpsPageView({
    required this.pushUpCount,
    required this.highestPushUpCount,
    required this.incrementPushUps,
    required this.resetPushUps,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Push Ups: $pushUpCount'),
          Text('Highest Push Ups: $highestPushUpCount'),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: incrementPushUps,
            child: Text('Do Push Up'),
          ),
          ElevatedButton(
            onPressed: resetPushUps,
            child: Text('Reset Count'),
          ),
        ],
      ),
    );
  }
}
