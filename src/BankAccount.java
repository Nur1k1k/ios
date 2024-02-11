import java.util.HashMap;
import java.util.Map;

public class BankAccount {
    private String accountNumber;
    private String accountOwner;
    private double balance;

    private static Map<String, BankAccount> accountMap = new HashMap<>();

    // Constructor
    public BankAccount(String accountNumber, String accountOwner, double initialBalance) {
        this.accountNumber = accountNumber;
        this.accountOwner = accountOwner;
        this.balance = initialBalance;

        // Check for uniqueness of account number
        if (accountMap.containsKey(accountNumber)) {
            throw new IllegalArgumentException("Account number must be unique.");
        } else {
            accountMap.put(accountNumber, this);
        }
    }

    // Deposit method
    public void deposit(double amount) {
        if (amount > 0) {
            balance += amount;
            System.out.println("Deposit successful. Current balance: " + balance);
        } else {
            System.out.println("Invalid deposit amount.");
        }
    }

    // Withdraw method
    public void withdraw(double amount) {
        if (amount > 0 && balance >= amount) {
            balance -= amount;
            System.out.println("Withdrawal successful. Current balance: " + balance);
        } else {
            System.out.println("Invalid withdrawal amount or insufficient funds.");
        }
    }

    // Get current balance
    public double getBalance() {
        return balance;
    }

    // Method to display account information
    public void displayAccountInfo() {
        System.out.println("Account Number: " + accountNumber);
        System.out.println("Account Owner: " + accountOwner);
        System.out.println("Current Balance: " + balance);
    }

    // Main method for testing
    public static void main(String[] args) {
        // Test the BankAccount class
        BankAccount account1 = new BankAccount("123456789", "John Doe", 1000.0);
        account1.displayAccountInfo();
        account1.deposit(500.0);
        account1.withdraw(200.0);
        account1.withdraw(1500.0);  // Should print insufficient funds
        account1.displayAccountInfo();

        BankAccount account2 = new BankAccount("987654321", "Jane Smith", 2000.0);
        account2.displayAccountInfo();
        account2.withdraw(1000.0);
        account2.deposit(-200.0);   // Should print invalid deposit amount
        account2.displayAccountInfo();
    }
}
