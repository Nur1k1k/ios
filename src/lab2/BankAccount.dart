class BankAccount {
  String accountNumber;
  String accountOwner;
  double balance;

  static Map<String, BankAccount> accountMap = {};

  // Constructor
  BankAccount(this.accountNumber, this.accountOwner, this.balance) {
    // Check for uniqueness of account number
    if (accountMap.containsKey(accountNumber)) {
      throw ArgumentError("Account number must be unique.");
    } else {
      accountMap[accountNumber] = this;
    }
  }

  // Deposit method
  void deposit(double amount) {
    if (amount > 0) {
      balance += amount;
      print("Deposit successful. Current balance: $balance");
    } else {
      print("Invalid deposit amount.");
    }
  }

  // Withdraw method
  void withdraw(double amount) {
    if (amount > 0 && balance >= amount) {
      balance -= amount;
      print("Withdrawal successful. Current balance: $balance");
    } else {
      print("Invalid withdrawal amount or insufficient funds.");
    }
  }

  // Get current balance
  double getBalance() {
    return balance;
  }

  // Method to display account information
  void displayAccountInfo() {
    print("Account Number: $accountNumber");
    print("Account Owner: $accountOwner");
    print("Current Balance: $balance");
  }

  // Main method for testing
  static void main() {
    // Test the BankAccount class
    var account1 = BankAccount("123456789", "John Doe", 1000.0);
    account1.displayAccountInfo();
    account1.deposit(500.0);
    account1.withdraw(200.0);
    account1.withdraw(1500.0);  // Should print insufficient funds
    account1.displayAccountInfo();

    var account2 = BankAccount("987654321", "Jane Smith", 2000.0);
    account2.displayAccountInfo();
    account2.withdraw(1000.0);
    account2.deposit(-200.0);   // Should print invalid deposit amount
    account2.displayAccountInfo();
  }
}

void main() {
  BankAccount.main();
}
