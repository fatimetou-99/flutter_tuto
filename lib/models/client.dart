

class User {
  final int id;
  final String name;
  final int code;

  User({required this.id, required this.name, required this.code});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['code'],
      name: json['nom'],
      code: json['email'],
    );
  }

  Map<String, dynamic> toJson() => {
    'nom': name,
    'email': code,
  };
}