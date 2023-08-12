import 'package:fitcore_trainer_app/home_page.dart';
import 'package:fitcore_trainer_app/plank_page.dart';
import 'package:fitcore_trainer_app/push_ups_page.dart';
import 'package:flutter/material.dart';

class Exercise {
  final String title;
  final IconData icon;
  final Widget page;

  Exercise({
    required this.title,
    required this.icon,
    required this.page,
  });
}

List<Exercise> exercises = [
  Exercise(
    title: 'Push Ups',
    icon: Icons.fitness_center,
    page: PushUpsPage(),
  ),
  Exercise(
    title: 'Plank',
    icon: Icons.accessibility_new,
    page: PlankPage(),
  ),
  Exercise(
    title: 'Upcoming...',
    icon: Icons.upcoming_rounded,
    page: HomePage(),
  ), Exercise(
    title: 'Upcoming...',
    icon: Icons.upcoming_rounded,
    page: HomePage(),
  ),

  //I can add more exercises from here
];
