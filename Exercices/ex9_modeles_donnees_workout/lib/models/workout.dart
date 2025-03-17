// MODELE DE DONNEES WORKOUT

class Workout {
  final String id;
  final String name;
  final String category;
  final int duration;
  final String imageUrl;

  Workout({
    required this.id,
    required this.name,
    required this.category,
    required this.duration,
    required this.imageUrl,
  });
}

List<Workout> tabWorkout = [
  Workout(
    id: 'w1',
    name: 'Push-Ups',
    category: 'Strength',
    duration: 10,
    imageUrl: 'https://images.pexels.com/photos/3823063/pexels-photo-3823063.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  ),
  Workout(
    id: 'w2',
    name: 'Jumping Jacks',
    category: 'Cardio',
    duration: 5,
    imageUrl: '../../assets/images/jumping-jacks.jpg',
  ),
  Workout(
    id: 'w3',
    name: 'Plank',
    category: 'Strength',
    duration: 3,
    imageUrl: 'https://images.pexels.com/photos/2294363/pexels-photo-2294363.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  ),
];
