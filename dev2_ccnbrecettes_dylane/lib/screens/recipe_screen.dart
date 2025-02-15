import 'package:flutter/material.dart';
import '../widgets/recipe_card.dart';
import 'add_recipe_screen.dart';
import '../theme/app_colors.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({super.key});

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  List<Map<String, String>> recipes = [
    {
      "title": "Tarte aux pommes",
      "description": "Une tarte aux pommes avec du fromage",
      "category": "Dessert"
    },
    {
      "title": "Tarte aux fraises",
      "description": "Une tarte aux fraises avec du fromage",
      "category": "Dessert"
    },
    {
      "title": "Tarte aux noix",
      "description": "Une tarte aux noix avec du fromage",
      "category": "Dessert"
    },
  ];

  // Liste des recettes favorites
  Set<String> favoriteRecipes = {};

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
      shape: RoundedRectangleBorder(
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
              final recipe = recipes[index]; // Récupérer la recette actuelle
              final isFavorite = favoriteRecipes.contains(recipe["title"]);

              return RecipesCard(
                title: recipes[index]["title"]!,
                description: recipes[index]["description"]!,
                category: recipes[index]["category"]!,
                onFavoritePressed: () =>
                    _toggleFavorite(recipes[index]["title"]!),
                isFavorite: isFavorite, // Nouvelle variable pour gérer l'icône
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _showAddRecipeDialog,
          backgroundColor: AppColors.primary,
          child: const Icon(Icons.add),
        ));
  }
}
