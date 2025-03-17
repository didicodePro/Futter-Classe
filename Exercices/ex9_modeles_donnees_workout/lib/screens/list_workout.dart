import 'package:flutter/material.dart';
import '../models/workout.dart';

class WorkoutListScreen extends StatelessWidget {
  final List<Workout> workouts;

  const WorkoutListScreen({super.key, required this.workouts});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: workouts.length,
      itemBuilder: (ctx, index) {
        final workout = workouts[index];
        return Card(
          margin: const EdgeInsets.all(8),
          child: ListTile(
            leading: Image.network(
              workout.imageUrl,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(workout.name),
            subtitle: Text('${workout.category} - ${workout.duration} min'),
            trailing: const Icon(Icons.fitness_center),
          ),
        );
      },
    );
  }
}
