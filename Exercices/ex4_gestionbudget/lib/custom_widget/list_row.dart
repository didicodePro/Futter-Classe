// FICHIER LIST_ROW.DART
// Imports pour communiquer avec le homeScreenKey du main.dart
// et pour l'accès aux couleurs.
import 'package:ex4_gestionbudget/app_colors.dart';
import 'package:ex4_gestionbudget/main.dart';
import 'package:flutter/material.dart';


// Widget pour la carte de la liste (item spécifique)
class ListRowDepense extends StatelessWidget {
  // Propriétés : depenseObj est une dépense spécifique de la liste _depenses (array)
  // de la classe mère GestionBudgetHomeState du fichier main.dart
  final Map<String, dynamic> depenseObj;

  // Index de l'item dans la liste
  final int index;

  // Constructeur
  const ListRowDepense({
    super.key,
    required this.depenseObj,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    // Dismissible permet de faire le supprimer avec un glissement à gauche
    return Dismissible(
      key: ValueKey(depenseObj),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        // homeScreenKey est une clé globale qui permet d'avoir l'état de l'item choisi de la liste
        // Cette clé du Widget parent permet d'accéder aux méthodes du Widget parent.
        homeScreenKey.currentState?.supprimerDepense(index);
      },
      // Lorsqu'on glisse à gauche, les détails du delete apparaissent
      background: Container(
        color: AppColors.errorColor,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        child: Icon(Icons.delete, color: Colors.white),
      ),
      // Card est un Widget qui permet de faire la mise en forme d'un item d'une liste
      child: Card(
        color: AppColors.backgroundLight,
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: AppColors.buttonBackground,
            foregroundColor: AppColors.buttonTextColor,
            child: Text(depenseObj['montantDepense'].toString()),
          ),
          title: Text(
            depenseObj['titreDepense'],
            style: TextStyle(color: AppColors.primary),
          ),
          subtitle: Text(
            "${depenseObj['categorieDepense']} - ${depenseObj['date'].toLocal().toString().split(' ')[0]}",
            style: TextStyle(color: AppColors.secondary),
          ),
        ),
      ),
    );
  }
}
