import 'package:flutter/material.dart';
//import 'package:exemple_wkout/models/workout.dart';

// Ajout de ce package
import 'package:cloud_firestore/cloud_firestore.dart';
import '../services/firestore_service.dart';

class WorkoutListScreen extends StatelessWidget {
  // Créer une instance du Firestore
  final FirestoreService firestoreService = FirestoreService();

  WorkoutListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Ajouter le StreamBuilder. Il écoute la data Stream afin d'afficher
    // les data au fur et à mesure qu'il y a modification du côté objet
    return StreamBuilder(
      stream: firestoreService.getWorkouts(),
      builder: (ctx, AsyncSnapshot<QuerySnapshot> snapshot) {
        // Vérification: y a-t-il un document en attente ?
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final workouts = snapshot.data!.docs;

        // Construire la liste permettant de suivre quelques modifications
        return ListView.builder(
          itemCount: workouts.length,
          itemBuilder: (ctx, index) {
            final workout = workouts[index];

            return Card(
              margin: const EdgeInsets.all(8),
              child: ListTile(
                leading: Image.network(
                  workout['imageUrl'],
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(workout['name']),
                subtitle: Text('${workout['category']} - ${workout['duration']} min'),
                // Ajout d'un bouton supprimer
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    firestoreService.deleteWorkout(workout.id);
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}
