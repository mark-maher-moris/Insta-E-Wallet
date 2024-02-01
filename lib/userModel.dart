class UserModel {
  String? name;
  double? totalBalance;
  String? password;
  String? userName;
  String? id;
  List<Transaction>? transactions;
  UserModel(this.id, this.name, this.password, this.totalBalance,
      this.transactions, this.userName);
  UserModel.fromJson(Map<String, dynamic> data) {
    name = data['name'];
    totalBalance = data['totalBalance'];
    password = data['password'];
    userName = data['userName'];
    id = data['id'];
    data['transactions'].forEach((element) {
      transactions?.add(Transaction.fromJson(element));
    });
  }
  //UserModel toJson() {}
}

class Transaction {
  TransactionType? transactionType;
  double? amount;
  String? id;
  DateTime? transactionDate;
  Transaction(this.amount, this.id, this.transactionDate, this.transactionType);
  Transaction.fromJson(Map<String, dynamic> data) {
    id = data['id'];
  }
}

enum TransactionType { Withdrow, Add, transfere }
