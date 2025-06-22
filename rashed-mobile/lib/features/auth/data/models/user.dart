class User {
  String? id;
  String? email;
  String? name;

  User({
    this.id,
    this.email,
    this.name,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'],
    email: json['email'],
    name: json['name'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email,
    'name': name,
  };
}