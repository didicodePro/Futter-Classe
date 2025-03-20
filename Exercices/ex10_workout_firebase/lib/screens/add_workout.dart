import 'package:flutter/material.dart';

class AddWorkoutScreen extends StatefulWidget {
  final Function(String, String, int, String) onAddWorkout;

  const AddWorkoutScreen({super.key, required this.onAddWorkout});

  @override
  AddWorkoutScreenState createState() => AddWorkoutScreenState();
}

class AddWorkoutScreenState extends State<AddWorkoutScreen> {
  final _nameController = TextEditingController();
  final _categoryController = TextEditingController();
  final _durationController = TextEditingController();
  final _imageUrlController = TextEditingController();

  void _submitForm() {
    final name = _nameController.text.trim();
    final category = _categoryController.text.trim();
    final duration = int.tryParse(_durationController.text.trim()) ?? 0;
    final imageUrl = _imageUrlController.text.trim();

    if (name.isEmpty || category.isEmpty || duration <= 0 || imageUrl.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Veuillez remplir tous les champs")),
      );
      return;
    }

    widget.onAddWorkout(name, category, duration, imageUrl);

    // Réinitialiser les champs
    _nameController.clear();
    _categoryController.clear();
    _durationController.clear();
    _imageUrlController.clear();

    // Afficher un message de succès
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Entraînement ajouté avec succès !")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Workout Name'),
          ),
          TextField(
            controller: _categoryController,
            decoration: const InputDecoration(labelText: 'Category'),
          ),
          TextField(
            controller: _durationController,
            decoration: const InputDecoration(labelText: 'Duration (minutes)'),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: _imageUrlController,
            decoration: const InputDecoration(labelText: 'Image URL'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: _submitForm,
            child: const Text('Add Workout'),
          ),
        ],
      ),
    );
  }
}
