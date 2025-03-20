import 'package:flutter/material.dart';
import '../models/garagesale.dart';
import '../services/firebase_service.dart';
import 'dart:math';

class AddGarageSale extends StatefulWidget {
  const AddGarageSale({super.key});

  @override
  AddGarageSaleState createState() => AddGarageSaleState();
}

class AddGarageSaleState extends State<AddGarageSale> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> garagesaleData = {};
  DateTime? selectedDate;
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  String? selectedCategory;
  String? imageUrl;
  final FirebaseService _firebaseService = FirebaseService();

  final List<String> categories = ["Outils", "Vêtements", "Articles d’enfants", "Électronique"];

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context, bool isStartTime) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() {
        if (isStartTime) {
          startTime = picked;
        } else {
          endTime = picked;
        }
      });
    }
  }

  Future<void> _saveSale() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      GarageSale newSale = GarageSale(
        id: Random().nextInt(1000).toString(),
        address: garagesaleData['address'] ?? '',
        city: garagesaleData['city'] ?? '',
        date: selectedDate != null
            ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
            : "Non spécifiée",
        startTime: startTime != null ? startTime!.format(context) : "Non spécifiée",
        endTime: endTime != null ? endTime!.format(context) : "Non spécifiée",
        notes: selectedCategory ?? "Autre",
        imagePath: imageUrl ?? "", 
      );

      await _firebaseService.addGarageSale(newSale);

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ajouter une Vente')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Adresse'),
                  validator: (value) => value!.isEmpty ? "Champ requis" : null,
                  onSaved: (value) => garagesaleData['address'] = value ?? '',
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Ville'),
                  validator: (value) => value!.isEmpty ? "Champ requis" : null,
                  onSaved: (value) => garagesaleData['city'] = value ?? '',
                ),

                SizedBox(height: 10),

                // Sélection de la date
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        selectedDate == null
                            ? "Sélectionner une date"
                            : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: () => _selectDate(context),
                    ),
                  ],
                ),

                // Sélection de l'heure de début
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        startTime == null
                            ? "Heure de début"
                            : startTime!.format(context),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.access_time),
                      onPressed: () => _selectTime(context, true),
                    ),
                  ],
                ),

                // Sélection de l'heure de fin
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        endTime == null
                            ? "Heure de fin"
                            : endTime!.format(context),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.access_time),
                      onPressed: () => _selectTime(context, false),
                    ),
                  ],
                ),

                SizedBox(height: 10),

                // Sélection de la catégorie avec Dropdown
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(labelText: "Catégorie"),
                  value: selectedCategory,
                  onChanged: (newValue) {
                    setState(() {
                      selectedCategory = newValue;
                    });
                  },
                  items: categories.map((category) {
                    return DropdownMenuItem(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                ),

                SizedBox(height: 10),

                // ✅ Champ pour entrer l’URL de l’image
                TextFormField(
                  decoration: InputDecoration(labelText: 'URL de l’image'),
                  validator: (value) =>
                      value!.isEmpty ? "Veuillez entrer une URL d’image" : null,
                  onSaved: (value) => imageUrl = value,
                ),

                SizedBox(height: 20),

                // Bouton d'enregistrement
                Center(
                  child: ElevatedButton(
                    onPressed: _saveSale,
                    child: Text('Enregistrer'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
