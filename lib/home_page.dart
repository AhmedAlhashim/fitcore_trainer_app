import 'package:flutter/material.dart';
import 'app_drawer.dart';
import 'exercise_data.dart';
// Single Responsibility Principle

// Open/Closed Principle:
// TrainingGridItem widget's behavior IS customized with different exercise data.

// Dependency Inversion Principle:
// Direct use of concrete classes for UI components.

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FitCore Trainer'),
        backgroundColor: Color(0xFF4DB6AC),
      ),
      backgroundColor: Colors.white.withOpacity(0.8),
      drawer: AppDrawer(exercises: exercises),
      body: Center(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: exercises.length, // Use the length of the exercises list
          itemBuilder: (context, index) {
            return TrainingGridItem(
              exercise: exercises[index], // Pass the exercise item
            );
          },
        ),
      ),
    );
  }
}

class TrainingGridItem extends StatelessWidget {
  final Exercise exercise;

  TrainingGridItem({required this.exercise});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => exercise.page));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF4DB6AC),
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                spreadRadius: 5,
                blurRadius: 20,
                offset: Offset(0, 3),
              ),
            ],
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                exercise.icon,
                size: 40,
                color: Colors.white,
              ),
              SizedBox(height: 5),
              Text(
                exercise.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
