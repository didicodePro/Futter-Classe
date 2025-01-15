// Affichage des règles du jeu
print("🎮 Bienvenue au jeu Roche-Papier-Ciseaux 🎮")
print("""
Les règles sont simples :
- ✊ Roche bat ✌️ Ciseaux
- ✌️ Ciseaux bat ✋ Papier
- ✋ Papier bat ✊ Roche
Essayez de battre l'ordinateur ! 🎯
""")

// Fonction pour valider le nombre de tours
func validateNumberOfRounds(_ input: String?) -> Int? {
    if let input = input, let numberOfRounds = Int(input), numberOfRounds > 0 {
        return numberOfRounds // Retourne le nombre valide
    }
    return nil // Retourne nil si la validation échoue
}

// Fonction pour valider le choix de l'utilisateur
func validateUserChoice(_ input: String?, validChoices: [String]) -> String? {
    if let input = input?.uppercased(), validChoices.contains(input) {
        return input // Retourne le choix valide
    }
    return nil // Retourne nil si la validation échoue
}

// Fonction pour déterminer le gagnant d'un tour
func findWinner(_ userChoice: String, _ cpuChoice: String) -> String {
    if userChoice == cpuChoice {
        return "Egalite"
    }
    if (userChoice == "R" && cpuChoice == "C") ||
       (userChoice == "C" && cpuChoice == "P") ||
       (userChoice == "P" && cpuChoice == "R") {
        return "Joueur"
    }
    return "CPU"
}

// Initialisation des variables
let choices = ["R", "P", "C"] // Les choix possibles
var userScore = 0
var cpuScore = 0
var numberOfRounds = 0

// Partie principale : demander le nombre de tours
print("\nCombien de tours voulez-vous jouer ?")
if let input = readLine(), let validRounds = validateNumberOfRounds(input) {
    numberOfRounds = validRounds
    print("La partie se fera en \(numberOfRounds) tours.")
} else {
    print("Veuillez entrer un nombre de tours valide et supérieur à 0.")
    exit(1) // Quitte le programme en cas d'erreur
}

// Boucle pour chaque tour
for round in 1...numberOfRounds {
    print("\n--- Tour \(round) ---")
    
    // Choix de l'utilisateur
    var userChoice = ""
    while true {
        print("Faites votre choix : R pour Roche, P pour Papier, C pour Ciseaux.")
        if let validChoice = validateUserChoice(readLine(), validChoices: choices) {
            userChoice = validChoice
            print("Vous avez choisi : \(userChoice)")
            break // Sortir de la boucle si l'entrée est valide
        } else {
            print("Choix invalide. Veuillez entrer R, P ou C.")
        }
    }
    
    // Choix de l'ordinateur
    let cpuChoice = choices.randomElement()!
    print("L'ordinateur a choisi : \(cpuChoice)")
    
    // Déterminer le gagnant du tour
    let result = findWinner(userChoice, cpuChoice)
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
