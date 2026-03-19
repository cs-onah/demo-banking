class User {
  String? id;
  String? firstName;
  String? lastName;
  String? avatar;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  User copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? avatar,
  }) =>
      User(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        avatar: avatar ?? this.avatar,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    avatar: json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstName": firstName,
    "lastName": lastName,
    "avatar": avatar,
  };
}
