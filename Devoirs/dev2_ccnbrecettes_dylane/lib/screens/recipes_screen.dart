import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/recipe_card.dart';
import 'add_recipe_screen.dart';

class RecipesScreen extends StatefulWidget {
  const RecipesScreen({super.key});

  @override
  State<RecipesScreen> createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  List<Map<String, String>> recipes = [
    {
      "title": "Tarte aux pommes",
      "description": "Délicieuse tarte",
      "category": "Dessert"
    },
    {
      "title": "Pizza maison",
      "description": "Pizza à la mozzarella",
      "category": "Plat"
    },
  ];

  Set<String> favoriteRecipes = {}; // Stocke les favoris

  void _toggleFavorite(String title) {
    setState(() {
      if (favoriteRecipes.contains(title)) {
        favoriteRecipes.remove(title);
      } else {
        favoriteRecipes.add(title);
      }
    });
  }

  void _showAddRecipeDialog() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return AddRecipeScreen(
          onRecipeAdded: (title, description, category) {
            setState(() {
              recipes.add({
                "title": title,
                "description": description,
                "category": category
              });
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("RECETTES CCNB"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            final recipe = recipes[index];
            final isFavorite = favoriteRecipes.contains(recipe["title"]);

            return RecipesCard(
              title: recipe["title"]!,
              description: recipe["description"]!,
              category: recipe["category"]!,
              isFavorite: isFavorite,
              onFavoritePressed: () => _toggleFavorite(recipe["title"]!),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddRecipeDialog,
        backgroundColor: AppColors.primary(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
