class BankAccount {
  final int id;
  final String name;
  double _balance;

  BankAccount(this.id, this.name, [this._balance=0]);

  double get balance => _balance;

  void credit(double amount){
    if (amount <0){
      throw Exception('Amount must be greater than zero!');
    }
    _balance += amount;
  }

  void withdraw(double amount){
    if(amount > _balance){
      throw Exception('Insufficient balance for withdrawal!');
    } else if (amount <= 0){
      throw Exception('Amount must be greater than zero!');
    }
    _balance -= amount;
  }

}

class Bank {
  final String bankName;
  final Map<int, BankAccount> _accounts = {};

  Bank({required this.bankName});

  BankAccount createAccount(int id, String name){
    if(_accounts.containsKey(id)){
      throw Exception('Account with ID $id already exists!');
    }
    final account = BankAccount(id, name);
    _accounts[id] = account;
    return account;
  }

}

void main() {

  Bank myBank = Bank(bankName: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount.balance); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
