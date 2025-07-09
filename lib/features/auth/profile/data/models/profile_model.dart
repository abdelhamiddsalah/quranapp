class UserModel {
  final String username;
  final String email;
  final String? theme;
  final String role;

  UserModel({
    required this.username,
    required this.email,
    required this.theme,
    required this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'],
      email: json['email'],
      theme: json['theme'] ?? '',
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'username': username, 'email': email, 'theme': theme, 'role': role};
  }
}
