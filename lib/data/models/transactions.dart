class Transaction {
  String? name;
  DateTime? transactionDate;
  String? amount;
  String? userId;
  String? id;

  Transaction({
    this.name,
    this.transactionDate,
    this.amount,
    this.userId,
    this.id,
  });

  Transaction copyWith({
    String? name,
    DateTime? transactionDate,
    String? amount,
    String? userId,
    String? id,
  }) =>
      Transaction(
        name: name ?? this.name,
        transactionDate: transactionDate ?? this.transactionDate,
        amount: amount ?? this.amount,
        userId: userId ?? this.userId,
        id: id ?? this.id,
      );

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
    name: json["name"],
    transactionDate: json["transactionDate"] == null ? null : DateTime.parse(json["transactionDate"]),
    amount: json["amount"],
    userId: json["userId"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "transactionDate": transactionDate?.toIso8601String(),
    "amount": amount,
    "userId": userId,
    "id": id,
  };
}
