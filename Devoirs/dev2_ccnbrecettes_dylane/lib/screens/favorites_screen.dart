import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/theme_provider.dart';
import '../widgets/recipe_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).themeData;
    

    List<Map<String, String>> favoriteRecipes = [
      {
        "title": "Tarte aux fraises",
        "description": "Une tarte aux fraises avec du fromage",
        "category": "Dessert"
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favoris"),
        backgroundColor: theme.primaryColor,
      ),
      body: favoriteRecipes.isEmpty
          ? const Center(child: Text("Aucun favori pour le moment."))
          : ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: favoriteRecipes.length,
              itemBuilder: (context, index) {
                return RecipesCard(
                  title: favoriteRecipes[index]["title"]!,
                  description: favoriteRecipes[index]["description"]!,
                  category: favoriteRecipes[index]["category"]!,
                  isFavorite: true, // Toujours favori ici
                );
              },
            ),
    );
  }
}
