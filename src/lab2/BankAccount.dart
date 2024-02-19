class BankAccount {
  String accountNumber;
  String accountOwner;
  double balance;

  static Map<String, BankAccount> accountMap = {};

  BankAccount(this.accountNumber, this.accountOwner, this.balance) {
    if (accountMap.containsKey(accountNumber)) {
      throw ArgumentError("Account number must be unique.");
    } else {
      accountMap[accountNumber] = this;
    }
  }


  void deposit(double amount) {
    if (amount > 0) {
      balance += amount;
      print("Deposit successful. Current balance: $balance");
    } else {
      print("Invalid deposit amount.");
    }
  }


  void withdraw(double amount) {
    if (amount > 0 && balance >= amount) {
      balance -= amount;
      print("Withdrawal successful. Current balance: $balance");
    } else {
      print("Invalid withdrawal amount or insufficient funds.");
    }
  }


  double getBalance() {
    return balance;
  }


  void displayAccountInfo() {
    print("Account Number: $accountNumber");
    print("Account Owner: $accountOwner");
    print("Current Balance: $balance");
  }


  static void main() {
    var account1 = BankAccount("123456789", "John Doe", 1000.0);
    account1.displayAccountInfo();
    account1.deposit(500.0);
    account1.withdraw(200.0);
    account1.withdraw(1500.0);
    account1.displayAccountInfo();

    var account2 = BankAccount("987654321", "Jane Smith", 2000.0);
    account2.displayAccountInfo();
    account2.withdraw(1000.0);
    account2.deposit(-200.0);
    account2.displayAccountInfo();
  }
}

void main() {
  BankAccount.main();
}
