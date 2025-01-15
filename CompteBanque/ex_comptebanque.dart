import "dart:io";
void main() async{
  while(true){
    print("--- Gestion de comptes Bancaires ---");
    print("1. Creer un compte");
    print("2. Deposer argent");
    print("3. Retirer argent");
    print("5. Enregistrer les transaction");
    print("6. Quitter");

    stdout.write("Choisissez une oprion : ");
    var input = stdin.readLineSync();

    switch (input){
      case "1": 
        stdout.write("Entrez le nom du titulaire du compte : ");
        var name = stdin.readLineSync() ?? "";

        stdout.write("Entrez le depot initial : ");
        var initialDeposit = double.tryParse(stdin.readLineSync() ?? "") ?? -1;

        // ECRIRE LE CODE POUR CREER COMPTE
    }
  }
}