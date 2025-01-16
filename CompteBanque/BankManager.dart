// classe pour gerer plusieurs comptes
import 'BankAccount.dart';

class BankManager {

  // Liste des comptes
  List<BankAccount> accounts = [];

  // Methode de creation de compte
  void createAccount(String accountHolder, double initialDeposit){
    if(initialDeposit < 0){
      print("Le depot initial ne peut pas etre negatif.");
    }
    else{
      accounts.add(BankAccount(accountHolder, initialDeposit));
      print("compte cree pour $accountHolder avec un depot initial de ${initialDeposit.toStringAsFixed(2)}");
    }
  }

  // Recherche de compte avec le nom du client
  BankAccount? findAccount(String accountHolder){
    try{
      // retourne le premier element qui satisfait la Recherche
      return accounts.firstWhere((account) => account.accountHolder == accountHolder);
    }catch(e){
      return null; // Si aucun compte est trouve
    }
  }

  // Methode qui simule un enregistrement a un fichier
  Future<void> saveTransactions() async {
    print("enregistrement des transcations en cours...");
    await Future.delayed(Duration(seconds: 2));
    print("Transactions enregistrees avec succes !");
  }
}