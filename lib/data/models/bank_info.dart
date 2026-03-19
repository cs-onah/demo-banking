class BankInfo {
  String? userId;
  double? balance;
  String? cardNumber;
  DateTime? expiryDate;
  String? provider;
  String? id;

  BankInfo({
    this.userId,
    this.balance,
    this.cardNumber,
    this.expiryDate,
    this.provider,
    this.id,
  });

  BankInfo copyWith({
    String? userId,
    double? balance,
    String? cardNumber,
    DateTime? expiryDate,
    String? provider,
    String? id,
  }) => BankInfo(
    userId: userId ?? this.userId,
    balance: balance ?? this.balance,
    cardNumber: cardNumber ?? this.cardNumber,
    expiryDate: expiryDate ?? this.expiryDate,
    provider: provider ?? this.provider,
    id: id ?? this.id,
  );

  factory BankInfo.fromJson(Map<String, dynamic> json) => BankInfo(
    userId: json["userId"],
    balance: double.tryParse(json["balance"] ?? ''),
    cardNumber: json["cardNumber"],
    expiryDate: json["expiryDate"] == null
        ? null
        : DateTime.parse(json["expiryDate"]),
    provider: json["provider"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "balance": balance,
    "cardNumber": cardNumber,
    "expiryDate": expiryDate?.toIso8601String(),
    "provider": provider,
    "id": id,
  };
}
