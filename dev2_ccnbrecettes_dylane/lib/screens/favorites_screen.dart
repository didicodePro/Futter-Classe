import 'package:flutter/material.dart';
import '../widgets/recipe_card.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Map<String, String>> favoriteRecipes;
  final Function(String) onToggleFavorite;

  const FavoritesScreen({
    super.key,
    required this.favoriteRecipes,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mes Favoris")),
      body: favoriteRecipes.isEmpty
          ? const Center(child: Text("Aucune recette favorite 😢"))
          : Padding(
              padding: const EdgeInsets.all(8),
              child: ListView.builder(
                itemCount: favoriteRecipes.length,
                itemBuilder: (context, index) {
                  final recipe = favoriteRecipes[index];

                  return RecipesCard(
                    title: recipe["title"]!,
                    description: recipe["description"]!,
                    category: recipe["category"]!,
                    isFavorite: true, // Toujours favori ici
                    onFavoritePressed: () => onToggleFavorite(recipe["title"]!),
                  );
                },
              ),
            ),
    );
  }
}
