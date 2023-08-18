import 'package:flutter/material.dart';
import 'exercise_data.dart';


// Open/Closed Principle
// Dependency Inversion Principle (DIP): High-level module (AppDrawer) depends on abstractions (Widget).
// both applied here
class AppDrawer extends StatelessWidget {
  final List<Exercise> exercises; // Receive the exercises list

  AppDrawer({required this.exercises});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white.withOpacity(0.8),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF4DB6AC),
              ),
              child: Text(
                'FitCore Trainer',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                ),
              ),
            ),
            for (var exercise in exercises) //  looping to generate the list
              ListTile(
                title: Text(exercise.title),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => exercise.page));
                },
              ),
          ],
        ),
      ),
    );
  }
}
