import 'BankAccount.dart';
import 'BankManager.dart';

void main() {
  BankAccount dylaneAccount = BankAccount("Dylane", 1681.52);
  BankAccount juniorAccount = BankAccount("junior", 582.0);

  BankManager manager = BankManager();

  manager.createAccount("pricesse", 1287.53);
  manager.createAccount("junior", 582.0);

  BankAccount? princesseAccount = manager.findAccount("pricesse");

  dylaneAccount.displayBalance();
  if (princesseAccount != null) {
    princesseAccount.deposit(55.56);
    princesseAccount.displayBalance();
  }
  manager.saveTransactions();
  juniorAccount.displayBalance();

  dylaneAccount.deposit(50.89);
  dylaneAccount.displayBalance();
  dylaneAccount.withdraw(10.95);
  dylaneAccount.displayBalance();
}
