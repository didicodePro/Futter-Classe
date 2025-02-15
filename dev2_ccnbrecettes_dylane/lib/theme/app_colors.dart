import 'package:flutter/material.dart';

class AppColors {
  // 🎨 Couleurs pour le mode clair
  static const Color lightPrimary = Color(0xFF5D5DA8);
  static const Color lightSecondary = Color(0xFF8665B1);
  static const Color lightBackground = Color(0xFFF8F8F8);
  static const Color lightTextPrimary = Colors.black87;
  static const Color lightTextSecondary = Colors.grey;

  // 🎨 Couleurs pour le mode sombre
  static const Color darkPrimary = Color(0xFF252542);
  static const Color darkSecondary = Color(0xFF322745);
  static const Color darkBackground = Color(0xFF1E1E2E);
  static const Color darkTextPrimary = Colors.white;
  static const Color darkTextSecondary = Color(0xFFABABAB);

  // 🌗 Gérer automatiquement en fonction du thème
  static Color primary(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? darkPrimary : lightPrimary;

  static Color secondary(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? darkSecondary : lightSecondary;

  static Color background(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? darkBackground : lightBackground;

  static Color textPrimary(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? darkTextPrimary : lightTextPrimary;

  static Color textSecondary(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? darkTextSecondary : lightTextSecondary;
}
