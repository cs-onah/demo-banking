class User {
  String? id;
  String? firstName;
  String? lastName;
  String? avatar;
  String? walletId;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.avatar,
    this.walletId,
  });

  User copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? avatar,
    String? walletId,
  }) =>
      User(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        avatar: avatar ?? this.avatar,
        walletId: walletId ?? this.walletId,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    avatar: json["avatar"],
    walletId: json["walletId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstName": firstName,
    "lastName": lastName,
    "avatar": avatar,
    "walletId": walletId,
  };
}
