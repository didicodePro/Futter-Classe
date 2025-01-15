// Affichage des règles du jeu
print("🎮 Bienvenue au jeu Roche-Papier-Ciseaux 🎮")
print("""
Les règles sont simples :
- ✊ Roche bat ✌️ Ciseaux
- ✌️ Ciseaux bat ✋ Papier
- ✋ Papier bat ✊ Roche
Essayez de battre l'ordinateur ! 🎯
""")

func validateInput(_ input: String?) -> Int? {
    if let input = input, let numberOfRounds = Int(input), numberOfRounds > 0 {
        return numberOfRounds // Retourne le nombre valide
    }
    return nil // Retourne nil si la vérification échoue
}

func findWinner(_ userChoice: String, _ cpuChoice: String) -> String {
    if (userChoice == cpuChoice) {
        return "Egalite"
    }
    if (userChoice == "R" && cpuChoice == "C") ||
       (userChoice == "C" && cpuChoice == "P") ||
       (userChoice == "P" && cpuChoice == "R") {
        return "Joueur"
    }
     return "CPU"
}

var userScore = 0;
var cpuScore = 0;
var numberOfRounds = 0;

// Partie principale
print("\nCombien de tours voulez-vous jouer ?")
if let input = readLine(), let numberOfRounds = validateInput(input) {
    print("La partie se fera en \(numberOfRounds) tours.")
} else {
    print("Veuillez entrer un nombre de tours valide et supérieur à 0.")
}

let choices = ["R","P","C"];

var userChoice = "";
var cpuChoice = "";

for round in 1...numberOfRounds{
  print("\n--- Tour \(round) ---")

// userChoice
print("Faites votre choix : R pour Roche, P pour Papier, C pour Ciseaux.")
if let userInput = readLine()?.uppercased() {
    if choices.contains(userInput) {
        let userChoice = userInput
        print("Vous avez choisi : \(userChoice)")
    } else {
        print("Choix invalide. Veuillez entrer R, P ou C.")
    }
} else {
    print("Aucune saisie détectée.")
}

// cpuChoice
if let cpuChoice = choices.randomElement(){
        print("L'ordinateur a choisi  : \(cpuChoice)")    
}


// Determiner le gagnant du tour
let result = findWinner(userChoice,cpuChoice)
    switch result {
    case "Joueur":
        print("\n✅ Vous avez gagné ce tour !")
        userScore += 1
    case "CPU":
        print("\n❌ L'ordinateur a gagné ce tour.")
        cpuScore += 1
    default:
        print("\n🤝 Ce tour est une égalité.")
    }
// Afficher les scores après chaque tour
    print("Score actuel - Vous : \(userScore) | Ordinateur : \(cpuScore)")

		print("\n===============================================================")
}
// Résultat final
print("\n--- Résultat final ---")
if userScore > cpuScore {
		print("🎉 Félicitations ! Vous avez gagné avec un score de \(userScore) contre \(cpuScore).")
} else if cpuScore > userScore {
		print("😞 L'ordinateur a gagné avec un score de \(cpuScore) contre \(userScore).")
} else {
		print("🤝 C'est une égalité parfaite avec un score de \(userScore) partout.")
}