import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/theme_provider.dart';

class RecipesCard extends StatelessWidget {
  final String title;
  final String description;
  final String category;
  final VoidCallback? onFavoritePressed;
  final bool isFavorite;

  const RecipesCard({
    super.key,
    required this.title,
    required this.description,
    required this.category,
    this.onFavoritePressed,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).themeData;

    return Card(
      color: theme.cardColor, // Utilisation de la couleur du thème
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
        title: Text(
          title,
          style:
              theme.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(description, style: theme.textTheme.bodyMedium),
            SizedBox(height: 4), // Petit espace entre description et catégorie
            Text("Catégorie: $category", style: theme.textTheme.bodyMedium),
          ],
        ),
        trailing: IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? theme.primaryColor : Colors.grey,
          ),
          onPressed: onFavoritePressed,
        ),
      ),
    );
  }
}
