import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextButton(
              child: const Text('Submit'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
            ),
            TextButton(
              onPressed: () {
                // Action à réaliser
              },
              child: const Text('Annuler'),
            ),
            ElevatedButton(
              onPressed: () {
                // Action à réaliser
              },
              child: const Text('Valider'),
            ),
            IconButton(
              icon: const Icon(Icons.favorite),
              onPressed: () {
                // Action à réaliser
              },
            ),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Titre de la carte', style: TextStyle(fontSize: 18)),
                    SizedBox(height: 8),
                    Text('Description ou contenu de la carte.'),
                  ],
                ),
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                // Action à réaliser
              },
              child: const Icon(Icons.add),
            ),
            CircleAvatar(
              radius: 30,
              backgroundImage:
                  NetworkImage('https://images.app.goo.gl/j4cJNNckctrLCawp7'),
            ),
            ElevatedButton(
              onPressed: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (pickedDate != null) {
                  // Faites quelque chose avec la date choisie
                }
              },
              child: const Text('Choisir une date'),
            ),

            // Les champs du formulaire viendront ici
          ],
        ),
      ),
    );
  }
}
