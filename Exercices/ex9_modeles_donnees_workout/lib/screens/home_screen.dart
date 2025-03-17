import 'package:flutter/material.dart';
import '../models/workout.dart';
import '../screens/add_workout.dart';
import '../screens/list_workout.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Workout> tabListWorkouts = List.from(tabWorkout);

  void _addWorkout(String name, String category, int duration, String imageUrl) {
    final newWorkout = Workout(
      id: DateTime.now().toString(),
      name: name,
      category: category,
      duration: duration,
      imageUrl: imageUrl,
    );

    setState(() {
      tabListWorkouts.add(newWorkout);
      _selectedIndex = 0;
    });
  }

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      WorkoutListScreen(workouts: tabListWorkouts),
      AddWorkoutScreen(onAddWorkout: _addWorkout),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Workout Tracker')),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTabSelected,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.fitness_center), label: 'Workouts'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add Workout'),
        ],
      ),
    );
  }
}
