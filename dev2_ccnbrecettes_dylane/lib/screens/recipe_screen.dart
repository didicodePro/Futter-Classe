import 'package:flutter/material.dart';
import '../widgets/recipe_card.dart';
import 'add_recipe_screen.dart';
import '../theme/app_colors.dart';
import 'favorites_screen.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({super.key});

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  List<Map<String, String>> recipes = [
    {"title": "Tarte aux pommes", "description": "Délicieuse tarte", "category": "Dessert"},
    {"title": "Pizza maison", "description": "Pizza à la mozzarella", "category": "Plat"},
  ];

  Set<String> favoriteRecipes = {}; // Stocke les titres des favoris

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
              recipes.add({"title": title, "description": description, "category": category});
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Filtrer les recettes favorites
    final favoriteRecipesList = recipes
        .where((recipe) => favoriteRecipes.contains(recipe["title"]))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("RECETTES CCNB"),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoritesScreen(
                    favoriteRecipes: favoriteRecipesList,
                    onToggleFavorite: _toggleFavorite,
                  ),
                ),
              );
            },
          )
        ],
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
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add),
      ),
    );
  }
}
