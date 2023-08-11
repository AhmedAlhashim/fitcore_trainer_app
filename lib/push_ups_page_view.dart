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

  String getRank(int count) {
    if (count >= 50) {
      return 'Elite';
    } else if (count >= 25) {
      return 'Advanced';
    } else if (count >= 10) {
      return 'Intermediate';
    } else {
      return 'Beginner';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Touch your nose to the circle to start counting",
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: incrementPushUps,
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
                  '$pushUpCount',
                  style: TextStyle(
                    fontSize: 100,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Your Rank:',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text(
            '${getRank(pushUpCount)}',
            style: TextStyle(
              fontSize: 20,
              color: Color(0xFF4DB6AC),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Current Record:',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text(
            '$highestPushUpCount push-ups (${getRank(highestPushUpCount)})',
            style: TextStyle(fontSize: 20, color: Colors.grey),
          ),
          SizedBox(height: 75),
          ElevatedButton(
            onPressed: resetPushUps,
            child: Text('Reset Count'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shadowColor: Colors.grey,
              textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            ),
          ),
        ],
      ),
    );
  }
}
