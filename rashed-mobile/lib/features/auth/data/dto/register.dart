class RegisterDTO {
  RegisterDTO({
    required this.email,
    required this.username,
    required this.password,
  });

  final String email;
  final String username;
  final String password;

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': username,
      'password': password,
    };
  }
}