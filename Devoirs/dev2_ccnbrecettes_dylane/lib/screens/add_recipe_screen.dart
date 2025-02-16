import 'package:flutter/material.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_colors.dart';

class AddRecipeScreen extends StatefulWidget {
  final Function(String, String, String) onRecipeAdded;

  const AddRecipeScreen({super.key, required this.onRecipeAdded});

  @override
  // ignore: library_private_types_in_public_api
  _AddRecipeScreenState createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  String selectedCategory = "Déjeuner";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Ajouter une recette",
              style: AppTextStyles.recipeTitle(context)),
          TextField(
            controller: titleController,
            decoration: InputDecoration(labelText: "Nom de la recette"),
          ),
          TextField(
            controller: descriptionController,
            decoration: InputDecoration(labelText: "Description"),
          ),
          DropdownButtonFormField<String>(
            value: selectedCategory,
            items: ["Déjeuner", "Dîner", "Souper", "Dessert", "Plat", "Autre"]
                .map((category) {
              return DropdownMenuItem(value: category, child: Text(category));
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedCategory = value!;
              });
            },
            decoration: InputDecoration(labelText: "Catégorie"),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              if (titleController.text.isNotEmpty &&
                  descriptionController.text.isNotEmpty) {
                widget.onRecipeAdded(
                  titleController.text,
                  descriptionController.text,
                  selectedCategory,
                );
                Navigator.pop(context);
              }
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary(context)),
            child: Text("Sauver recette", style: AppTextStyles.buttonText),
          ),
        ],
      ),
    );
  }
}
