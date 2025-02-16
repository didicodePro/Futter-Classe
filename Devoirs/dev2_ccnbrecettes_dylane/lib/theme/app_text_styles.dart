import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static TextStyle appBarTitle(BuildContext context) {
    return TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppColors.textPrimary(context),
    );
  }

  static TextStyle recipeTitle(BuildContext context) {
    return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: AppColors.textPrimary(context),
    );
  }

  static TextStyle recipeSubtitle(BuildContext context) {
    return TextStyle(
      fontSize: 14,
      color: AppColors.textSecondary(context),
    );
  }

  static TextStyle buttonText = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
}
