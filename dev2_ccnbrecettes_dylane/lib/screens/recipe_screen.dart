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
    {"title": "Tarte aux pommes", "description": "Délicieuse tarte", "category": "Dessert"},
    {"title": "Pizza maison", "description": "Pizza à la mozzarella", "category": "Plat"},
  ];

  Set<String> favoriteRecipes = {};
  int _selectedIndex = 0; // 0 = Toutes les recettes, 1 = Favoris

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
    List<Map<String, String>> displayedRecipes =
        _selectedIndex == 0 ? recipes : recipes.where((recipe) => favoriteRecipes.contains(recipe["title"])).toList();

    return Scaffold(
      appBar: AppBar(title: const Text("RECETTES CCNB")),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: displayedRecipes.length,
          itemBuilder: (context, index) {
            final recipe = displayedRecipes[index];
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Toutes"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favoris"),
        ],
      ),
    );
  }
}
