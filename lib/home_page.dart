import 'package:flutter/material.dart';
import 'app_drawer.dart';
import 'push_ups_page.dart';
import 'plank_page.dart';

class HomePage extends StatelessWidget {
  final List<TrainingItem> trainingItems = [
    TrainingItem(
      title: 'Push Ups',
      icon: Icons.fitness_center,
      page: PushUpsPage(),
    ),
    TrainingItem(
      title: 'Plank',
      icon: Icons.accessibility_new,
      page: PlankPage(),
    ),
    // Add more TrainingItem instances as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FitCore Trainer'),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: trainingItems.length,
          itemBuilder: (context, index) {
            return TrainingGridItem(
              item: trainingItems[index],
            );
          },
        ),
      ),
    );
  }
}

class TrainingItem {
  final String title;
  final IconData icon;
  final Widget page;

  TrainingItem({
    required this.title,
    required this.icon,
    required this.page,
  });
}

class TrainingGridItem extends StatelessWidget {
  final TrainingItem item;

  TrainingGridItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => item.page));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                item.icon,
                size: 40, // Adjust the icon size as needed
                color: Colors.white,
              ),
              SizedBox(height: 5),
              Text(
                item.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14, // Adjust the font size as needed
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
