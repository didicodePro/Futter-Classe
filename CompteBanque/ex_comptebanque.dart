import "dart:io";

void main() async {
  while (true) {
    print("--- Gestion de comptes Bancaires ---");
    print("1. Créer un compte");
    print("2. Déposer de l'argent");
    print("3. Retirer de l'argent");
    print("5. Enregistrer les transactions");
    print("6. Quitter");

    stdout.write("Choisissez une option : ");
    var input = stdin.readLineSync();

    switch (input) {
      case "1":
        stdout.write("Entrez le nom du titulaire du compte : ");
        var name = stdin.readLineSync() ?? "";

        stdout.write("Entrez le dépôt initial : ");
        var initialDeposit = double.tryParse(stdin.readLineSync() ?? "") ?? -1;

        // ÉCRIRE LE CODE POUR CRÉER COMPTE

        break;

      case "2":
        stdout.write("Entrez le nom du titulaire du compte : ");
        var name = stdin.readLineSync() ?? "";

        // ÉCRIRE LE CODE POUR TROUVER COMPTE AVEC NOM, si pas trouvé (introuvable)

        // ÉCRIRE CODE POUR DÉPOSER MONTANT
        stdout.write("Entrez le montant à déposer : ");
        var amount = double.tryParse(stdin.readLineSync() ?? "") ?? -1;

        // Écrire l'appel de la méthode

        break;

      case "3":
        stdout.write("Entrez le nom du titulaire du compte : ");
        var name = stdin.readLineSync() ?? "";

        // ÉCRIRE LE CODE POUR TROUVER COMPTE AVEC NOM, si pas trouvé (introuvable)

        // ÉCRIRE CODE POUR RETIRER MONTANT
        stdout.write("Entrez le montant à retirer : ");
        var amount = double.tryParse(stdin.readLineSync() ?? "") ?? -1;

        // Écrire l'appel de la méthode

        break;

      case "4":
        stdout.write("Entrez le nom du titulaire du compte : ");
        var name = stdin.readLineSync() ?? "";

        // ÉCRIRE LE CODE POUR TROUVER COMPTE AVEC NOM, si pas trouvé (Introuvable)

        // ÉCRIRE LE CODE POUR AFFICHER BALANCE DU COMPTE
        break;

      case "5":
        // ÉCRIRE LE CODE POUR ENREGISTRER TRANSACTION (MÉTHODE QUI SIMULE UN ENREGISTREMENT À UN FICHIER)

        break;

      case "6":
        print("Au revoir !");
        return;

      default:
        print("Option invalide. Veuillez réessayer.");
    }
  }
}
