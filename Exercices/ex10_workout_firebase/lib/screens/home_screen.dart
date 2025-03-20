import 'package:ex10_workout_firebase/services/firestore_service.dart';
import 'package:flutter/material.dart';
//import 'package:ex10_workout_firebase/models/workout.dart';
import 'package:ex10_workout_firebase/screens/add_workout.dart';
import 'package:ex10_workout_firebase/screens/list_workout.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

// Modifier afin de simplifier le code car la gestion
// ne ce fait plus à ce niveau
class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Track selected tab

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // modifier
  final List<Widget> _pages = [
    WorkoutListScreen(),
    AddWorkoutScreen(
      onAddWorkout: (name, category, duration, imageUrl) {
        final FirestoreService firestoreService = FirestoreService();
        firestoreService.addWorkout(name, category, duration, imageUrl);
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Workout Tracker')),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTabSelected,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Workouts'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add Workout'),
        ],
      ),
    );
  }
}
