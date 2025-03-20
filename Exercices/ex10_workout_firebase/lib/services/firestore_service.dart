import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference workoutsCollection =
      FirebaseFirestore.instance.collection('workouts');

  // Ajouter un entraînement
  Future<void> addWorkout(String name, String category, int duration, String imageUrl) async {
     print("Ajout d'un workout: $name, $category, $duration, $imageUrl"); // 🔍 Debug
    await workoutsCollection.add({
      'name': name,
      'category': category,
      'duration': duration,
      'imageUrl': imageUrl,
    });
  }

  // Récupérer les entraînements en temps réel
  Stream<QuerySnapshot> getWorkouts() {
    return workoutsCollection.snapshots();
  }

  // Supprimer un entraînement
  Future<void> deleteWorkout(String id) async {
    await workoutsCollection.doc(id).delete();
  }
}
