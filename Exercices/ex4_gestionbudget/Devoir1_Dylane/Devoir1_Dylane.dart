import 'dart:io';
import 'dart:math';

// Valide et retourne un nombre de tours correct
int validateNumberOfRounds() {
  while (true) {
    print("\nCombien de tours voulez-vous jouer ?");
    String? input = stdin.readLineSync();
    int? numberOfRounds = int.tryParse(input ?? '');

    if (numberOfRounds != null && numberOfRounds > 0) {
      return numberOfRounds; // Retourne le nombre valide
    } else {
      print(
          "⚠️ Entrée invalide. Veuillez entrer un nombre entier positif superieur a zero.");
    }
  }
}

// Détermine le gagnant d'un round
String findWinner(String userChoice, String cpuChoice) {
  if (userChoice == cpuChoice) return "Egalite";

  if ((userChoice == "R" && cpuChoice == "C") ||
      (userChoice == "C" && cpuChoice == "P") ||
      (userChoice == "P" && cpuChoice == "R")) {
    return "Joueur";
  }
  return "CPU";
}

// Récupère un choix valide de l'utilisateur
String getUserChoice(List<String> choices) {
  while (true) {
    print(
        "\nFaites votre choix : R pour Roche, P pour Papier, C pour Ciseaux.");
    String? input = stdin.readLineSync();

    if (input != null && choices.contains(input.toUpperCase())) {
      return input.toUpperCase();
    } else {
      print("⚠️ Choix invalide. Veuillez entrer R, P ou C.");
    }
  }
}

// Affiche les règles du jeu
void displayRules() {
  print("""
          🎮 Bienvenue au jeu Roche-Papier-Ciseaux 🎮
                Les règles sont simples :
                - ✊ Roche bat ✌️ Ciseaux
                - ✌️ Ciseaux bat ✋ Papier
                - ✋ Papier bat ✊ Roche
              Essayez de battre l'ordinateur ! 🎯
        """);
}

// Main
void main() {
  List<String> choices = ["R", "P", "C"];
  int userScore = 0, cpuScore = 0;

  displayRules();

  // Demander un nombre de tours valide
  int numberOfRounds = validateNumberOfRounds();
  print("\n👍 La partie se jouera en $numberOfRounds tours !");

  // Boucle principale du jeu
  for (var i = 1; i <= numberOfRounds; i++) {
    print("\n--- 🕹️ Round $i ---");

    // Obtenir le choix de l'utilisateur
    String userChoice = getUserChoice(choices);
    print("\nVotre choix : $userChoice");

    // Générer le choix de l'ordinateur
    String cpuChoice = choices[Random().nextInt(choices.length)];
    print("Choix de l'ordinateur : $cpuChoice");

    // Déterminer le gagnant
    String result = findWinner(userChoice, cpuChoice);
    switch (result) {
      case "Joueur":
        print("\n✅ Vous avez gagné ce tour !");
        userScore++;
        break;
      case "CPU":
        print("\n❌ L'ordinateur a gagné ce tour.");
        cpuScore++;
        break;
      default:
        print("\n🤝 Ce tour est une égalité.");
    }

    // Afficher le score
    print("📊 Score actuel - Vous : $userScore | Ordinateur : $cpuScore");
    print("\n=========================================");
  }

  // Résultat final
  print("\n--- 🏆 Résultat final ---");
  if (userScore > cpuScore) {
    print(
        "🎉 Félicitations ! Vous avez gagné avec un score de $userScore contre $cpuScore.");
  } else if (cpuScore > userScore) {
    print(
        "😞 L'ordinateur a gagné avec un score de $cpuScore contre $userScore.");
  } else {
    print("🤝 C'est une égalité parfaite avec un score de $userScore partout.");
  }

  print("\nMerci d'avoir joué ! 🎮");
}
