import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class RecipesCard extends StatelessWidget {
  final String title;
  final String description;
  final String category;
  final bool isFavorite;
  final VoidCallback? onFavoritePressed;
  final VoidCallback? onTap;

  const RecipesCard({
    super.key,
    required this.title,
    required this.description,
    required this.category,
    required this.isFavorite,
    this.onFavoritePressed,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(10),
          title: Text(title, style: AppTextStyles.recipeTitle),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(description, style: AppTextStyles.recipeSubtitle),
              SizedBox(
                  height: 4), // Petit espace entre description et catégorie
              Text("Catégorie: $category", style: AppTextStyles.recipeSubtitle),
            ],
          ),
          trailing: IconButton(
            icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : AppColors.textPrimary),
            onPressed: onFavoritePressed,
          ),
        ));
  }
}
