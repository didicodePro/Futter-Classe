// Classe représentant un compte Bancaire
class BankAccount {
  // Attributs
  String accountHolder;
  double balance;

  // Constructeur
  BankAccount(this.accountHolder, this.balance);

  // Méthode de dépôt
  void deposit(double amount) {
    if (amount <= 0) {
      print("Le montant doit être supérieur à zéro.");
    } else {
      balance += amount;
      print("Dépôt effectué : ${amount.toStringAsFixed(2)}");
    }
  }

  // Méthode de retrait
  void withdraw(double amount) {
    if (amount <= 0) {
      print("Le montant doit être supérieur à zéro.");
      return;
    } else {
      if (amount > balance) {
        print("Fonds insuffisants. Retrait refusé.");
      } else {
        balance -= amount;
        print("Retrait effectué : ${amount.toStringAsFixed(2)}");
      }
    }
  }

  // Méthode pour afficher le solde et le nom du compte
  void displayBalance() {
    print("Solde actuel pour ${accountHolder} : ${balance.toStringAsFixed(2)}");
  }
}
